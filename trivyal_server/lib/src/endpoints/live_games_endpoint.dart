import 'dart:async';
import 'dart:math';

import 'package:rxdart/rxdart.dart';
import 'package:serverpod/serverpod.dart';
import 'package:trivyal_server/src/generated/protocol.dart';

class LiveGamesEndpoint extends Endpoint {
  static final Random _rng = Random();

  String _liveGameChannelName(int liveGameId) => 'LiveGames:$liveGameId';
  String _liveGameQuestionTimeoutChannelName(int gameId) =>
      '${_liveGameChannelName(gameId)}:questionTimeout';
  String _liveGameAnswerChannelName(int gameId) =>
      '${_liveGameChannelName(gameId)}:answer';

  Stream<LiveGame> _getLiveGameStream(Session session, LiveGame liveGame) {
    return session.messages
        .createStream<LiveGame>(_liveGameChannelName(liveGame.id!))
        .startWith(liveGame);
  }

  Stream<LiveGame> startOrJoinLiveGame(
    Session session, {
    required int gameId,
    required Stream<LiveGameAdminEvent> adminMessages,
  }) async* {
    final user = await _assertAuthenticated(session);

    var (liveGame: LiveGame latestLiveGame, game: Game gameData) =
        await _upsertLiveGame(session, gameId: gameId, userId: user.userId);

    session.addWillCloseListener(
      (session) => LiveGame.db.deleteRow(session, latestLiveGame),
    );

    yield* Rx.merge([
      adminMessages,
      _getLiveGameStream(session, latestLiveGame),
      session.messages.createStream<LiveGameAnswer>(
          _liveGameAnswerChannelName(latestLiveGame.id!)),
      session.messages.createStream<Question>(
          _liveGameQuestionTimeoutChannelName(latestLiveGame.id!)),
    ]).asyncMap(
      (event) async {
        switch (event) {
          case LiveGameAdminEvent.startGame:
            unawaited(
              _handleGameStart(
                session,
                liveGame: latestLiveGame,
                gameData: gameData,
              ),
            );

          case LiveGameAdminEvent.showPodium:
            unawaited(
              _handleShowPodium(
                session,
                liveGame: latestLiveGame,
                gameData: gameData,
              ),
            );

          case LiveGameAdminEvent.nextQuestion:
            unawaited(
              _handleShowNextQuestion(
                session,
                liveGame: latestLiveGame,
                gameData: gameData,
              ),
            );

          case LiveGame liveGame:
            latestLiveGame = liveGame;

          case LiveGameAnswer answer:
            latestLiveGame = await _handlePlayerAnswer(
                  session,
                  gameData: gameData,
                  liveGame: latestLiveGame,
                  playerName: answer.player,
                  answerId: answer.answerId,
                ) ??
                latestLiveGame;

          case Question questionTimeout:
            if (latestLiveGame.currentStatus ==
                    LiveGameStatus.answeringQuestion &&
                latestLiveGame.currentQuestion?.id == questionTimeout.id) {
              unawaited(
                _revealAnswer(
                  session,
                  liveGame: latestLiveGame,
                  gameData: gameData,
                ),
              );
            }

          case dynamic other:
            session.log(
              'Unknown event ignored: $other',
              level: LogLevel.warning,
            );
        }

        return latestLiveGame;
      },
    ).distinct();
  }

  Future<({Game game, LiveGame liveGame})> _upsertLiveGame(
    Session session, {
    required int gameId,
    required int userId,
  }) async {
    return await session.db.transaction(
      (txn) async {
        final gameData = (await Game.db.find(
          session,
          include: Game.include(questions: Question.includeList()),
          where: (g) => g.id.equals(gameId) & g.ownerId.equals(userId),
          transaction: txn,
        ))
            .singleOrNull;

        if (gameData == null) {
          throw Exception('Game not found');
        }

        final startedLiveGame = await LiveGame.db.findFirstRow(
          session,
          where: (l) => l.gameId.equals(gameData.id!),
          transaction: txn,
        );

        if (startedLiveGame != null) {
          return (liveGame: startedLiveGame, game: gameData);
        }

        int pin = _generateRandomPIN();

        while (await LiveGame.db.findFirstRow(
              session,
              where: (l) => l.pin.equals(pin),
              transaction: txn,
            ) !=
            null) {
          pin = _generateRandomPIN();
        }

        final liveGame = await LiveGame.db.insertRow(
          session,
          LiveGame(
            pin: pin,
            gameId: gameData.id!,
            players: [],
            currentStatus: LiveGameStatus.lobby,
            currentResults: {},
            playerAnswers: {},
            playerAnswersTime: {},
          ),
          transaction: txn,
        );

        return (liveGame: liveGame, game: gameData);
      },
    );
  }

  Future<void> _handleGameStart(
    Session session, {
    required LiveGame liveGame,
    required Game gameData,
  }) async {
    final LiveGame liveGameStarting = liveGame.copyWith(
      currentStatus: LiveGameStatus.starting,
      currentQuestion: null,
      currentQuestionIndex: -1,
      currentQuestionShowTime: null,
      currentResults: {},
      playerAnswers: {},
      playerAnswersTime: {},
    );
    await _broadcastLiveGameUpdate(session, liveGameStarting);

    await Future.delayed(const Duration(seconds: 3));
    await _handleShowNextQuestion(
      session,
      liveGame: liveGameStarting,
      gameData: gameData,
    );
  }

  Future<void> _handleShowPodium(
    Session session, {
    required LiveGame liveGame,
    required Game gameData,
  }) async {
    final LiveGame liveGamePodium =
        liveGame.copyWith(currentStatus: LiveGameStatus.podium);

    await LiveGame.db.updateRow(session, liveGamePodium);
    await _broadcastLiveGameUpdate(session, liveGamePodium);
  }

  Future<void> _handleShowNextQuestion(
    Session session, {
    required LiveGame liveGame,
    required Game gameData,
  }) async {
    final nextQuestionIndex = liveGame.currentQuestionIndex! + 1;

    if (nextQuestionIndex >= gameData.questions!.length) {
      final newLiveGame = liveGame.copyWith(
        currentQuestionIndex: null,
        currentQuestion: null,
        currentQuestionShowTime: null,
        currentStatus: LiveGameStatus.results,
        playerAnswers: null,
        playerAnswersTime: null,
      );

      await LiveGame.db.updateRow(session, newLiveGame);
      await _broadcastLiveGameUpdate(session, newLiveGame);
      return;
    }

    final nextQuestion = gameData.questions![nextQuestionIndex];
    final newLiveGame = liveGame.copyWith(
      currentQuestionIndex: nextQuestionIndex,
      currentQuestion: nextQuestion.copyWith(correctChoiceId: -1),
      currentQuestionShowTime: DateTime.now(),
      currentStatus: LiveGameStatus.answeringQuestion,
      playerAnswers: {},
      playerAnswersTime: {},
    );

    await LiveGame.db.updateRow(session, newLiveGame);
    await _broadcastLiveGameUpdate(session, newLiveGame);

    unawaited(
      Future.delayed(Duration(seconds: nextQuestion.timeInSeconds)).then(
        (_) => session.messages.postMessage(
          _liveGameQuestionTimeoutChannelName(newLiveGame.id!),
          nextQuestion,
        ),
      ),
    );
  }

  Stream<LiveGame> joinLiveGame(
    Session session, {
    required int pin,
    required String playerName,
    required Stream<int> answerIdStream,
  }) async* {
    LiveGame latestLiveGame =
        await _handlePlayerJoin(session, pin: pin, playerName: playerName);

    yield* Rx.merge([
      _getLiveGameStream(session, latestLiveGame),
      answerIdStream,
    ]).asyncMap(
      (event) async {
        switch (event) {
          case LiveGame liveGame:
            latestLiveGame = liveGame;

          case int answerId:
            unawaited(
              session.messages.postMessage(
                _liveGameAnswerChannelName(latestLiveGame.id!),
                LiveGameAnswer(player: playerName, answerId: answerId),
              ),
            );

          case dynamic other:
            session.log(
              'Unknown event ignored: $other',
              level: LogLevel.warning,
            );
        }

        return latestLiveGame;
      },
    ).distinct();
  }

  Future<LiveGame> _handlePlayerJoin(
    Session session, {
    required int pin,
    required String playerName,
  }) async {
    final updated = await session.db.transaction((txn) async {
      final liveGame = await LiveGame.db
          .findFirstRow(session, where: (l) => l.pin.equals(pin));

      if (liveGame == null) throw Exception('Live game not found');
      if (liveGame.players.contains(playerName)) {
        throw Exception('Player already joined');
      }

      return await LiveGame.db.updateRow(
        session,
        liveGame.copyWith(
          players: [...liveGame.players, playerName],
        ),
      );
    });
    await _broadcastLiveGameUpdate(session, updated);
    return updated;
  }

  Future<LiveGame?> _handlePlayerAnswer(
    Session session, {
    required Game gameData,
    required LiveGame liveGame,
    required String playerName,
    required int answerId,
  }) async {
    final updated = await LiveGame.db.updateRow(
      session,
      liveGame.copyWith(
        playerAnswers: {
          ...liveGame.playerAnswers,
          playerName: answerId,
        },
        playerAnswersTime: {
          ...liveGame.playerAnswersTime,
          playerName: DateTime.now(),
        },
      ),
    );

    // Return players answers only to admin session
    if (updated.playerAnswers.length < updated.players.length) {
      return updated;
    }

    await _revealAnswer(session, liveGame: updated, gameData: gameData);
    return null;
  }

  Future<void> _revealAnswer(
    Session session, {
    required LiveGame liveGame,
    required Game gameData,
  }) async {
    final newResults = {...liveGame.currentResults};
    for (final player in liveGame.players) {
      // Add 100 points for correct answers
      // and between 0-100 bonus points for fast answers dependening on answer time

      final playerAnswer = liveGame.playerAnswers[player];
      final playerAnswerTime = liveGame.playerAnswersTime[player];
      final currentQuestion =
          gameData.questions![liveGame.currentQuestionIndex!];

      if (playerAnswer == null ||
          playerAnswerTime == null ||
          playerAnswer != currentQuestion.correctChoiceId) {
        newResults[player] ??= 0;
        continue;
      }

      final questionShowTime = liveGame.currentQuestionShowTime!;
      final bonus = 100 *
          (1 -
              playerAnswerTime.difference(questionShowTime).inSeconds /
                  currentQuestion.timeInSeconds);

      newResults[player] = (newResults[player] ?? 0) + 100 + bonus.round();
    }

    final updated = liveGame.copyWith(
      currentStatus: LiveGameStatus.revealingAnswer,
      currentQuestion: gameData.questions![liveGame.currentQuestionIndex!],
      currentResults: newResults,
    );
    await LiveGame.db.updateRow(session, updated);
    await _broadcastLiveGameUpdate(session, updated);
  }

  Future<bool> _broadcastLiveGameUpdate(
          Session session, LiveGame liveGame) async =>
      await session.messages
          .postMessage(_liveGameChannelName(liveGame.id!), liveGame);

  int _generateRandomPIN() {
    int pin;
    do {
      pin = _rng.nextInt(1000000);
    } while (pin < 99999);
    return pin;
  }

  Future<AuthenticationInfo> _assertAuthenticated(Session session) async =>
      await session.authenticated ?? (throw Exception('Unauthenticated'));
}
