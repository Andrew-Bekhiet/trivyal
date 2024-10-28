import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_google_flutter/serverpod_auth_google_flutter.dart';
import 'package:trivyal_flutter/gameplay/game_shelll_screen.dart';

import '../utils/providers.dart';
import '../utils/secrets.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _pinController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final size = MediaQuery.sizeOf(context);
    final client = ref.watch(clientProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Welcome to Trivyal!',
                    style: textTheme.displaySmall,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Trivia for y'all!",
                    style: textTheme.titleMedium,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              Text(
                'Enter game PIN',
                style: textTheme.titleMedium,
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: size.width > size.height
                      ? 2 * size.width / 5
                      : size.width,
                ),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextFormField(
                        maxLength: 6,
                        controller: _pinController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          label: Text('Game PIN', textAlign: TextAlign.center),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly
                        ],
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a game PIN';
                          } else if (value.length != 6 ||
                              int.tryParse(value) == null) {
                            return 'Please enter a valid game PIN';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                          ),
                          label: Text('Your name', textAlign: TextAlign.center),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          floatingLabelAlignment: FloatingLabelAlignment.center,
                        ),
                        textAlign: TextAlign.center,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          return null;
                        },
                      ),
                      Builder(
                        builder: (context) {
                          return FilledButton(
                            child: const Text('Enter!'),
                            onPressed: () {
                              if (!Form.of(context).validate()) return;

                              final scaffoldMessenger =
                                  ScaffoldMessenger.of(context);

                              final streamController = StreamController<int>();
                              try {
                                final liveGameStream =
                                    client.liveGames.joinLiveGame(
                                  pin: int.parse(_pinController.text),
                                  playerName: _nameController.text,
                                  answerIdStream: streamController.stream,
                                );

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => GameShellScreen(
                                      playerName: _nameController.text,
                                      liveGameStream: liveGameStream,
                                      liveGamePlayerSink: streamController.sink,
                                    ),
                                  ),
                                );
                              } catch (e) {
                                streamController.close();

                                if (e
                                    .toString()
                                    .contains('Live game not found')) {
                                  scaffoldMessenger.showSnackBar(SnackBar(
                                    content: Text('Live game not found'),
                                    backgroundColor: Colors.red,
                                  ));
                                }
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                'or',
                style: textTheme.titleMedium,
              ),
              ConstrainedBox(
                constraints: BoxConstraints.tightFor(
                  width: size.width > size.height
                      ? 2 * size.width / 5
                      : size.width,
                ),
                child: SignInWithGoogleButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.grey[700],
                    alignment: Alignment.center,
                    textStyle: textTheme.titleMedium,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                  label: 'Sign in or sign up with Google',
                  serverClientId: googleServerClientId,
                  redirectUri: Uri.parse(ref.watch(serverWebServerUrlProvider))
                      .replace(pathSegments: ['googleSignIn']),
                  caller: client.modules.auth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
