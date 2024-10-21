import 'package:collection/collection.dart';
import 'package:serverpod/serverpod.dart';
import 'package:trivyal_server/src/generated/protocol.dart';
import 'package:trivyal_server/src/realtime/realtime_helper.dart';

class GamesEndpoint extends Endpoint {
  Stream<GameListResponse> watchAll(Session session) async* {
    final user = await _assertAuthenticated(session);

    yield* session.watchAll(
      fetchFromDB: () async => await Game.db.find(
        session,
        where: (g) => g.ownerId.equals(user.userId),
        orderBy: (g) => g.name,
        include: Game.include(questions: Question.includeList()),
      ),
      shouldProcessEvent: (_, data) => data.ownerId == user.userId,
      transform: (data) =>
          data.where((g) => g.ownerId == user.userId).sortedBy((g) => g.name),
      toResponse: (data) => GameListResponse(data: data),
    );
  }

  Stream<Game?> watchSingle(Session session, int id) async* {
    final user = await _assertAuthenticated(session);

    yield* session.watchSingle(
      fetchFromDB: () async {
        final game = await Game.db.findById(
          session,
          id,
          include: Game.include(questions: Question.includeList()),
        );

        if (game?.ownerId != user.userId) {
          return null;
        }

        return game;
      },
      shouldProcessEvent: (_, data) => data.ownerId == user.userId,
      toResponse: (data) => data,
    );
  }

  Future<Game> createGame(Session session, Game game) async {
    final user = await _assertAuthenticated(session);

    final created =
        await Game.db.insertRow(session, game.copyWith(ownerId: user.userId));
    await session.messages
        .postMessage('$Game.${ObjectWriteEvent.created.name}', created);

    return created;
  }

  Future<Game> updateGame(Session session, int id, Game newGame) async {
    final user = await _assertAuthenticated(session);

    if (newGame.id != null && newGame.id != id) {
      throw Exception('Invalid id');
    }

    final game = await Game.db.findById(session, id);

    if (game == null) {
      throw Exception('Game not found');
    }

    _assertUserIsGameOwner(user, game);

    final updated = await Game.db.updateRow(session, newGame);
    await session.messages
        .postMessage('$Game.${ObjectWriteEvent.updated.name}', updated);

    return updated;
  }

  Future<void> deleteGame(Session session, Game game) async {
    final user = await _assertAuthenticated(session);

    _assertUserIsGameOwner(user, game);

    final deleted = await Game.db.deleteRow(session, game);
    await session.messages
        .postMessage('$Game.${ObjectWriteEvent.deleted.name}', deleted);
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
