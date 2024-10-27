/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;
import 'dart:async' as _i2;
import 'package:trivyal_client/src/protocol/game_list_response.dart' as _i3;
import 'package:trivyal_client/src/protocol/game.dart' as _i4;
import 'package:trivyal_client/src/protocol/live_game.dart' as _i5;
import 'package:serverpod_auth_client/serverpod_auth_client.dart' as _i6;
import 'protocol.dart' as _i7;

/// {@category Endpoint}
class EndpointGames extends _i1.EndpointRef {
  EndpointGames(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'games';

  _i2.Future<_i3.GameListResponse> list() =>
      caller.callServerEndpoint<_i3.GameListResponse>(
        'games',
        'list',
        {},
      );

  _i2.Future<_i4.Game?> get(int id) => caller.callServerEndpoint<_i4.Game?>(
        'games',
        'get',
        {'id': id},
      );

  _i2.Future<_i4.Game> createGame(_i4.Game game) =>
      caller.callServerEndpoint<_i4.Game>(
        'games',
        'createGame',
        {'game': game},
      );

  _i2.Future<_i4.Game> updateGame(
    int id,
    _i4.Game newGame,
  ) =>
      caller.callServerEndpoint<_i4.Game>(
        'games',
        'updateGame',
        {
          'id': id,
          'newGame': newGame,
        },
      );

  _i2.Future<void> deleteGame(_i4.Game game) => caller.callServerEndpoint<void>(
        'games',
        'deleteGame',
        {'game': game},
      );
}

/// {@category Endpoint}
class EndpointLiveGames extends _i1.EndpointRef {
  EndpointLiveGames(_i1.EndpointCaller caller) : super(caller);

  @override
  String get name => 'liveGames';

  _i2.Future<_i5.LiveGame> startLiveGame(int gameId) =>
      caller.callServerEndpoint<_i5.LiveGame>(
        'liveGames',
        'startLiveGame',
        {'gameId': gameId},
      );
}

class _Modules {
  _Modules(Client client) {
    auth = _i6.Caller(client);
  }

  late final _i6.Caller auth;
}

class Client extends _i1.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    _i1.AuthenticationKeyManager? authenticationKeyManager,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _i1.MethodCallContext,
      Object,
      StackTrace,
    )? onFailedCall,
    Function(_i1.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
  }) : super(
          host,
          _i7.Protocol(),
          securityContext: securityContext,
          authenticationKeyManager: authenticationKeyManager,
          streamingConnectionTimeout: streamingConnectionTimeout,
          connectionTimeout: connectionTimeout,
          onFailedCall: onFailedCall,
          onSucceededCall: onSucceededCall,
          disconnectStreamsOnLostInternetConnection:
              disconnectStreamsOnLostInternetConnection,
        ) {
    games = EndpointGames(this);
    liveGames = EndpointLiveGames(this);
    modules = _Modules(this);
  }

  late final EndpointGames games;

  late final EndpointLiveGames liveGames;

  late final _Modules modules;

  @override
  Map<String, _i1.EndpointRef> get endpointRefLookup => {
        'games': games,
        'liveGames': liveGames,
      };

  @override
  Map<String, _i1.ModuleEndpointCaller> get moduleLookup =>
      {'auth': modules.auth};
}
