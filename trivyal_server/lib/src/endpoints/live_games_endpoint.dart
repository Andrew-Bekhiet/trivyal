import 'dart:math';

import 'package:serverpod/serverpod.dart';
import 'package:trivyal_server/src/generated/protocol.dart';

class LiveGamesEndpoint extends Endpoint {
  static final Random _rng = Random();

  Future<LiveGame> startLiveGame(Session session, int gameId) async {
    final user = await _assertAuthenticated(session);

    return await session.db.transaction(
      (txn) async {
        final game = (await Game.db.find(
          session,
          where: (g) => g.id.equals(gameId) & g.ownerId.equals(user.userId),
          transaction: txn,
        ))
            .singleOrNull;

        if (game == null) {
          throw Exception('Game not found');
        }

        if (await LiveGame.db.count(
              session,
              where: (l) => l.gameId.equals(game.id!),
              limit: 1,
              transaction: txn,
            ) >
            0) {
          throw Exception('Live game already started');
        }

        int pin = _generateRandomPIN();
        while ((await LiveGame.db.count(
              session,
              where: (l) => l.pin.equals(pin),
              limit: 1,
              transaction: txn,
            )) >
            0) {
          pin = _generateRandomPIN();
        }

        return await LiveGame.db.insertRow(
          session,
          LiveGame(
            pin: pin,
            gameId: game.id!,
          ),
          transaction: txn,
        );
      },
    );
  }

  int _generateRandomPIN() {
    final pin = _rng.nextInt(999999);

    if (pin < 100000) {
      return _generateRandomPIN();
    }

    return pin;
  }

  Future<AuthenticationInfo> _assertAuthenticated(Session session) async {
    final user = await session.authenticated;

    if (user == null) {
      throw Exception('Unauthenticated');
    }

    return user;
  }
}
