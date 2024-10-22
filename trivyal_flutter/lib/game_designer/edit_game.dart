import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';
import 'package:trivyal_flutter/game_designer/question_widget.dart';
import 'package:trivyal_flutter/utils/providers.dart';

class EditGame extends ConsumerStatefulWidget {
  final Game game;

  const EditGame({super.key, required this.game});

  @override
  ConsumerState<EditGame> createState() => _EditGameState();
}

class _EditGameState extends ConsumerState<EditGame> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late Game currentGame;

  @override
  void initState() {
    super.initState();

    currentGame = widget.game;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: currentGame.id == null
            ? Text('Create a new game')
            : Text('Edit game ${currentGame.name}'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  initialValue: currentGame.name,
                  decoration: InputDecoration(labelText: 'Game name'),
                  onChanged: (n) => currentGame.name = n,
                  validator: (n) =>
                      (n?.isEmpty ?? true) ? 'Please enter game name' : null,
                ),
                SizedBox(height: 8),
                for (final Question question in currentGame.questions ?? [])
                  QuestionEditor(
                    key: ValueKey(question),
                    question: question,
                    onDelete: () => setState(
                      () => currentGame.questions?.remove(question),
                    ),
                  ),
                SizedBox(height: 8),
                FilledButton.icon(
                  onPressed: () => setState(
                    () => currentGame.questions = [
                      ...?currentGame.questions,
                      Question(
                        text: '',
                        choices: [
                          Choice(id: 0, text: ''),
                          Choice(id: 1, text: ''),
                          Choice(id: 2, text: ''),
                          Choice(id: 3, text: ''),
                        ],
                        gameId: currentGame.id ?? -1,
                        correctChoiceId: 0,
                        timeInSeconds: 30,
                      ),
                    ],
                  ),
                  icon: Icon(Symbols.add),
                  label: Text('Add question'),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _maybeSaveForm,
        child: const Icon(Icons.save),
      ),
    );
  }

  Future<void> _maybeSaveForm() async {
    if (!formKey.currentState!.validate()) return;

    final client = ref.read(clientProvider);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final int? gameId = currentGame.id;

    try {
      if (gameId == null) {
        currentGame = await client.games.createGame(currentGame);

        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Game created successfully')),
        );
      } else {
        currentGame = await client.games.updateGame(gameId, currentGame);

        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Game updated successfully')),
        );
      }
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Oops! Something went wrong'),
        ),
      );
    }

    navigator.pop();
  }
}
