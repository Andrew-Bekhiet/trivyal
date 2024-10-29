import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:trivyal_client/trivyal_client.dart';

class AnsweringQuestionsWidget extends StatefulWidget {
  final LiveGame liveGame;
  final void Function(int)? onAnswer;

  const AnsweringQuestionsWidget({
    required this.liveGame,
    required this.onAnswer,
    super.key,
  });

  @override
  State<AnsweringQuestionsWidget> createState() =>
      _AnsweringQuestionsWidgetState();
}

class _AnsweringQuestionsWidgetState extends State<AnsweringQuestionsWidget>
    with SingleTickerProviderStateMixin {
  late Question currentQuestion = widget.liveGame.currentQuestion!;

  late final AnimationController _timerController = AnimationController(
    vsync: this,
    duration: Duration(seconds: currentQuestion.timeInSeconds),
  )..forward();

  late final Animation<double> _timerAnimation = _timerController.drive(
    Animatable.fromCallback(
      (value) => (1 - value) * currentQuestion.timeInSeconds,
    ),
  );

  bool hasAnswered = false;

  @override
  void didUpdateWidget(covariant AnsweringQuestionsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    final Question oldQuestion = oldWidget.liveGame.currentQuestion!;
    final Question newQuestion = widget.liveGame.currentQuestion!;

    if (oldQuestion.correctChoiceId != newQuestion.correctChoiceId) {
      currentQuestion = newQuestion;
    }

    if (oldQuestion.id != newQuestion.id) {
      hasAnswered = false;
      if (widget.liveGame.currentStatus == LiveGameStatus.answeringQuestion) {
        _timerController.forward(from: 0);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Center(
            child: Text(
              currentQuestion.text,
              style: TextStyle(fontSize: 35),
            ),
          ),
        ),
        if (widget.liveGame.currentStatus == LiveGameStatus.answeringQuestion)
          Expanded(
            child: AnimatedBuilder(
              animation: _timerController,
              builder: (context, child) => Stack(
                alignment: Alignment.center,
                children: [
                  Text(
                    _timerAnimation.value.floor().toString(),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  ConstrainedBox(
                    constraints:
                        const BoxConstraints.expand(height: 80, width: 80),
                    child: CircularProgressIndicator(
                      value: 1 - _timerController.value,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (hasAnswered &&
            widget.liveGame.currentStatus == LiveGameStatus.answeringQuestion)
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Waiting for other players to answer...'),
            ],
          )
        else
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
                if (widget.liveGame.currentStatus ==
                    LiveGameStatus.revealingAnswer)
                  FilledButton.icon(
                    onPressed: choice.id == currentQuestion.correctChoiceId
                        ? () {}
                        : null,
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          choice.color != null ? Color(choice.color!) : null,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    icon: choice.id == currentQuestion.correctChoiceId
                        ? Icon(Symbols.check, size: 40)
                        : Icon(Symbols.close, size: 40),
                    label: Text(choice.text),
                  )
                else
                  FilledButton(
                    onPressed: () {
                      if (widget.onAnswer != null) {
                        widget.onAnswer?.call(choice.id);
                        setState(() => hasAnswered = true);
                      }
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor:
                          choice.color != null ? Color(choice.color!) : null,
                      textStyle: Theme.of(context).textTheme.titleLarge,
                    ),
                    child: Text(choice.text),
                  ),
            ],
          ),
        SizedBox(height: 20),
      ],
    );
  }

  @override
  void dispose() {
    _timerController.dispose();

    super.dispose();
  }
}
