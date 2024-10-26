import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';
import 'package:trivyal_flutter/game_designer/edit_game.dart';
import 'package:trivyal_flutter/utils/providers.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final client = ref.watch(clientProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Trivyal'),
      ),
      body: StreamBuilder<List<Game>>(
        stream: client.games.watchAll().map((r) => r.data),
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
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => EditGame(game: game),
                  ),
                ),
                trailing: IconButton(
                  icon: Icon(Symbols.play_circle),
                  tooltip: 'Start live game',
                  onPressed: () async {
                    await client.liveGames.startLiveGame(game.id!);
                    // TODO: go to lobby
                    // Navigator.of(context).push(
                    //   MaterialPageRoute(
                    //     builder: (context) => const LobbyScreen(),
                    //   ),
                    // );
                  },
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
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
        ),
        child: const Icon(Symbols.add),
      ),
    );
  }
}
