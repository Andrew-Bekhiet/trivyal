import 'package:flutter/material.dart';

class LiveGameStartingWidget extends StatefulWidget {
  const LiveGameStartingWidget({super.key});

  @override
  State<LiveGameStartingWidget> createState() => _LiveGameStartingWidgetState();
}

class _LiveGameStartingWidgetState extends State<LiveGameStartingWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: Duration(seconds: 3),
  )..forward();

  late final Animation<int> countdownAnimation = _animationController.drive(
    TweenSequence(
      [
        TweenSequenceItem(
          tween: ConstantTween(3),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ConstantTween(2),
          weight: 1,
        ),
        TweenSequenceItem(
          tween: ConstantTween(1),
          weight: 1,
        ),
      ],
    ),
  );

  late final Animation<double> scaleAnimation = _animationController
      .drive(
        TweenSequence<double>(
          [
            TweenSequenceItem(
              tween: Tween(begin: 1, end: 0),
              weight: 1,
            ),
            TweenSequenceItem(
              tween: Tween(begin: 1, end: 0),
              weight: 1,
            ),
            TweenSequenceItem(
              tween: Tween(begin: 1, end: 0),
              weight: 1,
            ),
          ],
        ),
      )
      .drive(CurveTween(curve: Curves.fastOutSlowIn));

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.scale(
            scale: scaleAnimation.value,
            child: Text(
              countdownAnimation.value.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 80),
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }
}
