import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';
import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:trivyal_client/trivyal_client.dart';

enum AppEnvironment { dev, prod }

final Provider<AppEnvironment> appEnvironmentProvider =
    Provider<AppEnvironment>(
  (ref) => kDebugMode ? AppEnvironment.dev : AppEnvironment.prod,
);

final Provider<String> serverUrlProvider = Provider<String>(
  (ref) => ref.watch(appEnvironmentProvider) == AppEnvironment.dev
      ? 'http://$localhost:8080/'
      : 'https://trivyal.up.railway.app/api/',
);

final Provider<String> serverWebServerUrlProvider = Provider<String>(
  (ref) => ref.watch(appEnvironmentProvider) == AppEnvironment.dev
      ? 'http://$localhost:8082/'
      : 'https://trivyal.up.railway.app/',
);

final Provider<Client> clientProvider = Provider<Client>(
  (ref) {
    final client = Client(
      ref.watch(serverUrlProvider),
      authenticationKeyManager: FlutterAuthenticationKeyManager(),
    )..connectivityMonitor = FlutterConnectivityMonitor();

    return client;
  },
);

final ChangeNotifierProvider<SessionManager> sessionManagerProvider =
    ChangeNotifierProvider<SessionManager>(
  (ref) {
    final sessionManager =
        SessionManager(caller: ref.watch(clientProvider).modules.auth);

    ref.onDispose(sessionManager.dispose);

    return sessionManager;
  },
);
