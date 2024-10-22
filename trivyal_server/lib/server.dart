import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as auth;

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

// This is the starting point of your Serverpod server. In most cases, you will
// only need to make additions to this file if you add future calls,  are
// configuring Relic (Serverpod's web-server), or need custom setup work.

void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(
    args,
    Protocol(),
    Endpoints(),
    authenticationHandler: auth.authenticationHandler, // Added!
  );

  pod.webServer.addRoute(auth.RouteGoogleSignIn(), '/googleSignIn');

  // If you are using any future calls, they need to be registered here.
  // pod.registerFutureCall(ExampleFutureCall(), 'exampleFutureCall');

  // Serve all files in the /web directory.
  pod.webServer.addRoute(
    RouteStaticDirectory(serverDirectory: '.', serveAsRootPath: '/index.html'),
    '/*',
  );

  // Start the server.
  await pod.start();
}
