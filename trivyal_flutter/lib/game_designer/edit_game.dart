import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';
import 'package:trivyal_flutter/game_designer/question_widget.dart';
import 'package:trivyal_flutter/utils/providers.dart';

class EditGame extends ConsumerWidget {
  final Game game;

  const EditGame({super.key, required this.game});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      child: FormField<Game>(
        initialValue: game,
        builder: (state) {
          final context = state.context;
          final currentGame = state.value!;

          return Scaffold(
            appBar: AppBar(
              title: currentGame.id == null
                  ? Text('Create a new game')
                  : Text('Edit game ${currentGame.name}'),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      initialValue: currentGame.name,
                      decoration: InputDecoration(labelText: 'Game name'),
                      onChanged: (n) =>
                          state.didChange(currentGame.copyWith(name: n)),
                      validator: (n) => (n?.isEmpty ?? true)
                          ? 'Please enter game name'
                          : null,
                    ),
                    SizedBox(height: 8),
                    for (final Question question in currentGame.questions ?? [])
                      QuestionEditor(
                        key: ValueKey(question),
                        question: question,
                        onDelete: () => state.didChange(
                          currentGame.copyWith(
                            questions: currentGame.questions
                                ?.where((q) => q.id != question.id)
                                .toList(),
                          ),
                        ),
                      ),
                    SizedBox(height: 8),
                    FilledButton.icon(
                      onPressed: () => state.didChange(
                        currentGame.copyWith(
                          questions: [
                            ...?currentGame.questions,
                            Question(
                              id: (currentGame.questions ?? [])
                                      .map((q) => q.id ?? -1)
                                      .max +
                                  1,
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
                      ),
                      icon: Icon(Symbols.add),
                      label: Text('Add question'),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                final form = Form.of(context);
                if (!form.validate()) return;

                _saveGame(context, ref: ref, game: state.value!);
              },
              child: const Icon(Icons.save),
            ),
          );
        },
      ),
    );
  }

  Future<void> _saveGame(
    BuildContext context, {
    required WidgetRef ref,
    required Game game,
  }) async {
    final client = ref.read(clientProvider);
    final navigator = Navigator.of(context);
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    final int? gameId = game.id;

    try {
      if (gameId == null) {
        game = await client.games.createGame(game);

        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Game created successfully')),
        );
      } else {
        game = await client.games.updateGame(gameId, game);

        scaffoldMessenger.showSnackBar(
          const SnackBar(content: Text('Game updated successfully')),
        );
      }

      navigator.pop();
    } catch (e) {
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text('Oops! Something went wrong'),
        ),
      );
    }
  }
}
