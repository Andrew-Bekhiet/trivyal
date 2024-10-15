import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';

import 'auth/login_screen.dart';
import 'game_designer/home_screen.dart';
import 'utils/providers.dart';

void main() {
  runApp(
    const ProviderScope(
      child: TrivyalApp(),
    ),
  );
}

class TrivyalApp extends ConsumerStatefulWidget {
  const TrivyalApp({super.key});

  @override
  ConsumerState<TrivyalApp> createState() => _TrivyalAppState();
}

class _TrivyalAppState extends ConsumerState<TrivyalApp> {
  late SessionManager sessionManager;
  Future<void>? initSessionFuture;

  @override
  Widget build(BuildContext context) {
    sessionManager = ref.watch(sessionManagerProvider);
    initSessionFuture ??= sessionManager.initialize();

    return FutureBuilder(
      future: initSessionFuture,
      builder: (context, sessionInitialized) {
        return MaterialApp(
          title: 'Trivyal',
          theme: ThemeData.from(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
              brightness: PlatformDispatcher.instance.platformBrightness,
            ),
          ),
          home: sessionInitialized.connectionState == ConnectionState.done
              ? sessionManager.isSignedIn
                  ? const HomeScreen()
                  : const LoginScreen()
              : const Scaffold(
                  body: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
        );
      },
    );
  }
}
