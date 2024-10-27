import 'package:collection/collection.dart';
import 'package:serverpod/serverpod.dart';
import 'package:trivyal_server/src/generated/protocol.dart';

class GamesEndpoint extends Endpoint {
  static final EqualityBy<Question, dynamic> questionEquality = EqualityBy(
    (q) => [
      q.id,
      q.text,
      q.timeInSeconds,
      q.correctChoiceId,
      q.choices,
    ],
    DeepCollectionEquality(
      EqualityBy(
        (o) => o is Choice ? [o.id, o.text, o.color] : o,
        DeepCollectionEquality(),
      ),
    ),
  );

  Future<GameListResponse> list(Session session) async {
    final user = await _assertAuthenticated(session);

    final games = await Game.db.find(
      session,
      where: (g) => g.ownerId.equals(user.userId),
      orderBy: (g) => g.name,
      include: Game.include(questions: Question.includeList()),
    );

    return GameListResponse(data: games);
  }

  Future<Game?> get(Session session, int id) async {
    final user = await _assertAuthenticated(session);

    final game = await Game.db.findById(
      session,
      id,
      include: Game.include(questions: Question.includeList()),
    );

    if (game?.ownerId != user.userId) {
      return null;
    }

    return game;
  }

  Future<Game> createGame(Session session, Game game) async {
    final user = await _assertAuthenticated(session);

    final created = await session.db.transaction((txn) async {
      final createdGameRow = await Game.db.insertRow(
        session,
        game.copyWith(ownerId: user.userId),
        transaction: txn,
      );

      if (game.questions == null || game.questions!.isEmpty) {
        return createdGameRow;
      }

      final createdQuestions = await Question.db.insert(
        session,
        game.questions!
            .map((q) => q.copyWith(gameId: createdGameRow.id))
            .toList(),
        transaction: txn,
      );

      return createdGameRow.copyWith(questions: createdQuestions);
    });

    return created;
  }

  Future<Game> updateGame(Session session, int id, Game newGame) async {
    final user = await _assertAuthenticated(session);

    if (newGame.id != null && newGame.id != id) {
      throw Exception('Invalid id');
    }

    final updated = await session.db.transaction(
      (txn) async {
        final game = await Game.db.findById(
          session,
          id,
          include: Game.include(
            questions: Question.includeList(),
          ),
          transaction: txn,
        );

        if (game == null) {
          throw Exception('Game not found');
        }

        _assertUserIsGameOwner(user, game);

        if (game.ownerId != newGame.ownerId) {
          throw Exception('Unauthorized');
        }

        final updatedGameRow = await Game.db.updateRow(session, newGame);

        if (DeepCollectionEquality()
            .equals(newGame.questions, game.questions)) {
          return updatedGameRow;
        }

        final (:added, :updated, :removed) = _getQuestionsDelta(game, newGame);

        if (removed.isNotEmpty) {
          await Question.db.delete(session, removed.toList(), transaction: txn);
        }

        final List<Question> updatedQuestionsRows;
        if (updated.isNotEmpty) {
          updatedQuestionsRows = await Question.db
              .update(session, updated.toList(), transaction: txn);
        } else {
          updatedQuestionsRows = [];
        }

        final List<Question> addedQuestionsRows;
        if (added.isNotEmpty) {
          addedQuestionsRows = await Question.db
              .insert(session, added.toList(), transaction: txn);
        } else {
          addedQuestionsRows = [];
        }

        return updatedGameRow.copyWith(
          questions: game.questions
                  ?.where((q) => !removed.contains(q))
                  .map(
                    (q) =>
                        updatedQuestionsRows
                            .firstWhereOrNull((u) => u.id == q.id) ??
                        q,
                  )
                  .followedBy(addedQuestionsRows)
                  .toList() ??
              [],
        );
      },
    );

    return updated;
  }

  ({Set<Question> added, Set<Question> updated, Set<Question> removed})
      _getQuestionsDelta(Game game, Game newGame) {
    final Set<Question> oldQuestions = EqualitySet.from(
      questionEquality,
      game.questions!,
    );
    final Set<Question> newQuestions = EqualitySet.from(
      questionEquality,
      newGame.questions!,
    );

    final idEquality = EqualityBy<Question, int?>((q) => q.id);
    final Set<Question> updated =
        EqualitySet.from(idEquality, newQuestions).intersection(
      EqualitySet.from(idEquality, oldQuestions),
    );

    return (
      added: EqualitySet.from(idEquality, newQuestions.difference(oldQuestions))
          .difference(updated),
      updated: updated,
      removed:
          EqualitySet.from(idEquality, oldQuestions.difference(newQuestions))
              .difference(updated)
    );
  }

  Future<void> deleteGame(Session session, Game game) async {
    final user = await _assertAuthenticated(session);

    _assertUserIsGameOwner(user, game);

    await Game.db.deleteRow(session, game);
  }

  void _assertUserIsGameOwner(AuthenticationInfo user, Game game) {
    if (game.ownerId != user.userId) {
      throw Exception('Game not found');
    }
  }

  Future<AuthenticationInfo> _assertAuthenticated(Session session) async {
    final user = await session.authenticated;

    if (user == null) {
      throw Exception('Unauthenticated');
    }

    return user;
  }
}
