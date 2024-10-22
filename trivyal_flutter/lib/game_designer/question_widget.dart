import 'package:collection/collection.dart';
import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';

class QuestionEditor extends StatelessWidget {
  final Question question;
  final VoidCallback onDelete;

  const QuestionEditor({
    super.key,
    required this.question,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card.filled(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: FormField<Question>(
          initialValue: question,
          validator: (currentQuestion) {
            if (currentQuestion!.choices
                .none((c) => currentQuestion.correctChoiceId == c.id)) {
              return 'Please select the correct choice';
            }

            return null;
          },
          builder: (state) {
            final Question currentQuestion = state.value!;

            return InputDecorator(
              decoration: InputDecoration(
                errorText: state.errorText,
                border: InputBorder.none,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(labelText: 'Question'),
                          initialValue: currentQuestion.text,
                          onChanged: (t) => currentQuestion.text = t,
                          validator: (t) => (t?.isEmpty ?? true)
                              ? 'Please enter question text'
                              : null,
                        ),
                      ),
                      SizedBox(width: 8),
                      SizedBox(
                        width: 100,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          decoration:
                              InputDecoration(labelText: 'Time in seconds'),
                          initialValue:
                              currentQuestion.timeInSeconds.toString(),
                          onChanged: (t) => currentQuestion.timeInSeconds =
                              int.tryParse(t) ?? currentQuestion.timeInSeconds,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          validator: (t) => (t?.isEmpty ?? true)
                              ? 'Please enter question text'
                              : int.tryParse(t ?? '') == null
                                  ? 'Please enter a valid number'
                                  : null,
                        ),
                      ),
                      SizedBox(width: 8),
                      IconButton(
                        icon: Icon(Symbols.delete),
                        tooltip: 'Delete question',
                        onPressed: onDelete,
                      )
                    ],
                  ),
                  SizedBox(height: 8),
                  GridView(
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 50,
                    ),
                    padding: const EdgeInsets.all(8),
                    children: [
                      for (final choice in currentQuestion.choices)
                        Row(
                          children: [
                            Checkbox(
                              value:
                                  currentQuestion.correctChoiceId == choice.id,
                              onChanged: (value) => state.didChange(
                                  currentQuestion.copyWith(
                                      correctChoiceId: choice.id)),
                              shape: CircleBorder(),
                            ),
                            Expanded(
                              child: TextFormField(
                                key: ValueKey(choice),
                                decoration: InputDecoration(
                                  prefixIcon: IconButton(
                                    icon: Icon(Symbols.color_lens),
                                    tooltip: 'Select choice color',
                                    onPressed: () async {
                                      Color? selectedColor;

                                      if (!await ColorPicker(
                                        onColorChanged: (color) =>
                                            selectedColor = color,
                                        color: choice.color != null
                                            ? Color(choice.color!)
                                            : Colors.purple,
                                        pickersEnabled: {
                                          ColorPickerType.primary: false,
                                          ColorPickerType.accent: false,
                                          ColorPickerType.both: true,
                                          ColorPickerType.wheel: true,
                                        },
                                        enableTonalPalette: true,
                                      ).showPickerDialog(context)) return;

                                      if (selectedColor == null ||
                                          selectedColor == Colors.transparent) {
                                        return;
                                      }

                                      state.didChange(
                                        currentQuestion.copyWith(
                                          choices: currentQuestion.choices
                                              .map(
                                                (c) => c == choice
                                                    ? choice.copyWith(
                                                        color: selectedColor!
                                                            .value,
                                                      )
                                                    : c,
                                              )
                                              .toList(),
                                        ),
                                      );
                                    },
                                  ),
                                  labelText: 'Choice',
                                  filled: choice.color != null,
                                  fillColor: choice.color != null
                                      ? Color(choice.color!)
                                      : null,
                                  suffixIcon: currentQuestion.choices.length > 2
                                      ? IconButton(
                                          icon: Icon(Symbols.close),
                                          tooltip: 'Delete choice',
                                          onPressed: () {
                                            currentQuestion.choices
                                                .remove(choice);
                                            state.didChange(
                                                currentQuestion.copyWith(
                                              choices: currentQuestion.choices
                                                  .where((c) => c != choice)
                                                  .toList(),
                                            ));
                                          },
                                        )
                                      : null,
                                ),
                                initialValue: choice.text,
                                onChanged: (t) => choice.text = t,
                                validator: (t) => (t?.isEmpty ?? true)
                                    ? 'Please enter choice text'
                                    : null,
                              ),
                            ),
                          ],
                        ),
                      if (currentQuestion.choices.length < 4)
                        Center(
                          child: FilledButton.tonalIcon(
                            onPressed: () => state.didChange(
                              currentQuestion.copyWith(
                                choices: [
                                  ...currentQuestion.choices,
                                  Choice(
                                    id: currentQuestion.choices
                                            .map((c) => c.id)
                                            .max +
                                        1,
                                    text: '',
                                    color: null,
                                  ),
                                ],
                              ),
                            ),
                            icon: Icon(Symbols.add),
                            label: Text('Add choice'),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
