import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';
import 'package:trivyal_flutter/game_designer/edit_game.dart';
import 'package:trivyal_flutter/gameplay/game_shelll_screen.dart';
import 'package:trivyal_flutter/utils/providers.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final client = ref.watch(clientProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivyal'),
      ),
      body: FutureBuilder<List<Game>>(
        future: client.games.list().then((r) => r.data),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return ErrorWidget(snapshot.error!);
          }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final List<Game> gamesList = snapshot.data!;

          if (gamesList.isEmpty) {
            return const Center(
              child: Text(
                "No games created yet\nTap '+' to create a new one",
                textAlign: TextAlign.center,
              ),
            );
          }

          return ListView.builder(
            itemCount: gamesList.length,
            itemBuilder: (context, index) {
              final game = gamesList[index];

              return ListTile(
                title: Text(game.name),
                onTap: () async {
                  final updated = await Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => EditGame(game: game),
                    ),
                  );

                  if (updated == true) setState(() {});
                },
                trailing: IconButton(
                  icon: Icon(Symbols.play_circle),
                  tooltip: 'Start live game',
                  onPressed: () async {
                    final navigator = Navigator.of(context);

                    final streamController =
                        StreamController<LiveGameAdminEvent>();

                    try {
                      final liveGameStream =
                          client.liveGames.startOrJoinLiveGame(
                        gameId: game.id!,
                        adminMessages: streamController.stream,
                      );

                      navigator.push(
                        MaterialPageRoute(
                          builder: (context) => GameShellScreen(
                            liveGameStream: liveGameStream,
                            liveGameAdminSink: streamController.sink,
                          ),
                        ),
                      );
                    } catch (_) {
                      streamController.close();
                    }
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final added = await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => EditGame(
                game: Game(
                  name: 'New Game',
                  ownerId: ref.read(sessionManagerProvider).signedInUser!.id!,
                  questions: [
                    Question(
                      gameId: -1,
                      text: '',
                      timeInSeconds: 30,
                      choices: [
                        Choice(id: 0, text: ''),
                        Choice(id: 1, text: ''),
                        Choice(id: 2, text: ''),
                        Choice(id: 3, text: '')
                      ],
                      correctChoiceId: 0,
                    ),
                  ],
                ),
              ),
            ),
          );

          if (added == true) setState(() {});
        },
        child: const Icon(Symbols.add),
      ),
    );
  }
}
