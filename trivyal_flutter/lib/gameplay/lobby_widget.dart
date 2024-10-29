import 'package:flutter/material.dart';
import 'package:trivyal_client/trivyal_client.dart';

class LobbyWidget extends StatelessWidget {
  final LiveGame liveGame;

  const LobbyWidget({required this.liveGame, super.key});

  @override
  Widget build(BuildContext context) {
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
