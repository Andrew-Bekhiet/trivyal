/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;
import '../endpoints/games_endpoint.dart' as _i2;
import '../endpoints/live_games_endpoint.dart' as _i3;
import 'package:trivyal_server/src/generated/game.dart' as _i4;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i5;

class Endpoints extends _i1.EndpointDispatch {
  @override
  void initializeEndpoints(_i1.Server server) {
    var endpoints = <String, _i1.Endpoint>{
      'games': _i2.GamesEndpoint()
        ..initialize(
          server,
          'games',
          null,
        ),
      'liveGames': _i3.LiveGamesEndpoint()
        ..initialize(
          server,
          'liveGames',
          null,
        ),
    };
    connectors['games'] = _i1.EndpointConnector(
      name: 'games',
      endpoint: endpoints['games']!,
      methodConnectors: {
        'list': _i1.MethodConnector(
          name: 'list',
          params: {},
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['games'] as _i2.GamesEndpoint).list(session),
        ),
        'get': _i1.MethodConnector(
          name: 'get',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['games'] as _i2.GamesEndpoint).get(
            session,
            params['id'],
          ),
        ),
        'createGame': _i1.MethodConnector(
          name: 'createGame',
          params: {
            'game': _i1.ParameterDescription(
              name: 'game',
              type: _i1.getType<_i4.Game>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['games'] as _i2.GamesEndpoint).createGame(
            session,
            params['game'],
          ),
        ),
        'updateGame': _i1.MethodConnector(
          name: 'updateGame',
          params: {
            'id': _i1.ParameterDescription(
              name: 'id',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'newGame': _i1.ParameterDescription(
              name: 'newGame',
              type: _i1.getType<_i4.Game>(),
              nullable: false,
            ),
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['games'] as _i2.GamesEndpoint).updateGame(
            session,
            params['id'],
            params['newGame'],
          ),
        ),
        'deleteGame': _i1.MethodConnector(
          name: 'deleteGame',
          params: {
            'game': _i1.ParameterDescription(
              name: 'game',
              type: _i1.getType<_i4.Game>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['games'] as _i2.GamesEndpoint).deleteGame(
            session,
            params['game'],
          ),
        ),
      },
    );
    connectors['liveGames'] = _i1.EndpointConnector(
      name: 'liveGames',
      endpoint: endpoints['liveGames']!,
      methodConnectors: {
        'startLiveGame': _i1.MethodConnector(
          name: 'startLiveGame',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
          ) async =>
              (endpoints['liveGames'] as _i3.LiveGamesEndpoint).startLiveGame(
            session,
            params['gameId'],
          ),
        )
      },
    );
    modules['serverpod_auth'] = _i5.Endpoints()..initializeEndpoints(server);
  }
}
