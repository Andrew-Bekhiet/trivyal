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
import 'package:trivyal_server/src/generated/live_game_admin_event.dart' as _i5;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i6;

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
        'startOrJoinLiveGame': _i1.MethodStreamConnector(
          name: 'startOrJoinLiveGame',
          params: {
            'gameId': _i1.ParameterDescription(
              name: 'gameId',
              type: _i1.getType<int>(),
              nullable: false,
            )
          },
          streamParams: {
            'adminMessages':
                _i1.StreamParameterDescription<_i5.LiveGameAdminEvent>(
              name: 'adminMessages',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['liveGames'] as _i3.LiveGamesEndpoint)
                  .startOrJoinLiveGame(
            session,
            gameId: params['gameId'],
            adminMessages:
                streamParams['adminMessages']!.cast<_i5.LiveGameAdminEvent>(),
          ),
        ),
        'joinLiveGame': _i1.MethodStreamConnector(
          name: 'joinLiveGame',
          params: {
            'pin': _i1.ParameterDescription(
              name: 'pin',
              type: _i1.getType<int>(),
              nullable: false,
            ),
            'playerName': _i1.ParameterDescription(
              name: 'playerName',
              type: _i1.getType<String>(),
              nullable: false,
            ),
          },
          streamParams: {
            'answerIdStream': _i1.StreamParameterDescription<int>(
              name: 'answerIdStream',
              nullable: false,
            )
          },
          returnType: _i1.MethodStreamReturnType.streamType,
          call: (
            _i1.Session session,
            Map<String, dynamic> params,
            Map<String, Stream> streamParams,
          ) =>
              (endpoints['liveGames'] as _i3.LiveGamesEndpoint).joinLiveGame(
            session,
            pin: params['pin'],
            playerName: params['playerName'],
            answerIdStream: streamParams['answerIdStream']!.cast<int>(),
          ),
        ),
      },
    );
    modules['serverpod_auth'] = _i6.Endpoints()..initializeEndpoints(server);
  }
}
