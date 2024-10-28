import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';
import 'package:trivyal_flutter/gameplay/lobby_widget.dart';
import 'package:trivyal_flutter/gameplay/rank_widget.dart';
import 'package:trivyal_flutter/utils/providers.dart';

import 'answering_questions_widget.dart';
import 'live_game_starting_widget.dart';
import 'podium_widget.dart';

class GameShellScreen extends ConsumerStatefulWidget {
  final String? playerName;
  final Stream<LiveGame> liveGameStream;
  final StreamSink<LiveGameAdminEvent>? liveGameAdminSink;
  final StreamSink<int>? liveGamePlayerSink;

  const GameShellScreen({
    required this.liveGameStream,
    this.playerName,
    this.liveGamePlayerSink,
    this.liveGameAdminSink,
    super.key,
  });

  @override
  ConsumerState<GameShellScreen> createState() => _LobbyScreenState();
}

class _LobbyScreenState extends ConsumerState<GameShellScreen>
    with TickerProviderStateMixin {
  Map<String, int> lastResults = {};

  @override
  Widget build(BuildContext context) {
    final sessionManager = ref.watch(sessionManagerProvider.notifier);
    final isSignedIn = sessionManager.signedInUser != null;

    return StreamBuilder<LiveGame>(
      stream: widget.liveGameStream,
      builder: (context, liveGameSnapshot) {
        if (liveGameSnapshot.hasError && !liveGameSnapshot.hasData) {
          return ErrorWidget(liveGameSnapshot.error!);
        }

        if (!liveGameSnapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                'Game PIN Loading ...',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              toolbarHeight: kToolbarHeight * 2,
            ),
            body: const Center(child: CircularProgressIndicator()),
          );
        }

        final liveGame = liveGameSnapshot.requireData;

        final String pin = liveGame.pin.toString();

        if (liveGame.currentStatus == LiveGameStatus.answeringQuestion) {
          lastResults = liveGame.currentResults;
        }

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            actionsIconTheme: Theme.of(context).iconTheme.copyWith(size: 40),
            title: Text(
              'Game PIN: ${pin.substring(0, 3)} ${pin.substring(3, 6)}',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            toolbarHeight: kToolbarHeight * 2,
            actions: isSignedIn
                ? [
                    if (liveGame.currentStatus == LiveGameStatus.lobby)
                      IconButton(
                        icon: Icon(Symbols.play_circle),
                        tooltip: 'Start live game',
                        onPressed: () => widget.liveGameAdminSink
                            ?.add(LiveGameAdminEvent.startGame),
                      )
                    else if (liveGame.currentStatus ==
                        LiveGameStatus.revealingAnswer)
                      IconButton(
                        icon: Icon(Symbols.format_list_bulleted),
                        tooltip: 'Show podium',
                        onPressed: () => widget.liveGameAdminSink
                            ?.add(LiveGameAdminEvent.showPodium),
                      ),
                    if (liveGame.currentStatus == LiveGameStatus.podium ||
                        liveGame.currentStatus ==
                            LiveGameStatus.revealingAnswer)
                      IconButton(
                        icon: Icon(Symbols.play_arrow),
                        tooltip: 'Next question',
                        onPressed: () => widget.liveGameAdminSink
                            ?.add(LiveGameAdminEvent.nextQuestion),
                      )
                  ]
                : null,
          ),
          body: switch (liveGame.currentStatus) {
            LiveGameStatus.lobby => LobbyWidget(liveGame: liveGame),
            LiveGameStatus.starting => LiveGameStartingWidget(),
            LiveGameStatus.revealingAnswer ||
            LiveGameStatus.answeringQuestion =>
              AnsweringQuestionsWidget(
                onAnswer: widget.liveGamePlayerSink?.add,
                liveGame: liveGame,
              ),
            LiveGameStatus.podium =>
              PodiumWidget(lastResults: lastResults, liveGame: liveGame),
            LiveGameStatus.results ||
            LiveGameStatus.podium =>
              widget.playerName == null
                  ? PodiumWidget(lastResults: lastResults, liveGame: liveGame)
                  : RankWidget(
                      rank: liveGame.currentResults.entries
                              .sorted((a, b) => -a.value.compareTo(b.value))
                              .indexWhere(
                                (element) => element.key == widget.playerName!,
                              ) +
                          1),
          },
        );
      },
    );
  }

  @override
  void dispose() {
    super.dispose();

    widget.liveGameAdminSink?.close();
    widget.liveGamePlayerSink?.close();
  }
}
