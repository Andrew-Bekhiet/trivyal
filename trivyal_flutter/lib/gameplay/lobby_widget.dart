import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivyal_client/trivyal_client.dart';

class LobbyWidget extends ConsumerWidget {
  final LiveGame liveGame;

  const LobbyWidget({required this.liveGame, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (liveGame.players.isEmpty) {
      return const Center(
        child: Text('Waiting for players to join the game...'),
      );
    }

    return ListView.builder(
      itemCount: liveGame.players.length,
      itemBuilder: (context, index) {
        final player = liveGame.players[index];

        return ListTile(title: Text(player));
      },
    );
  }
}