import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:trivyal_client/trivyal_client.dart';

class PodiumWidget extends StatefulWidget {
  final LiveGame liveGame;
  final Map<String, int> lastResults;

  const PodiumWidget({
    required this.liveGame,
    required this.lastResults,
    super.key,
  });

  @override
  State<PodiumWidget> createState() => _PodiumWidgetState();
}

class _PodiumWidgetState extends State<PodiumWidget>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TextStyle? displaySmall = Theme.of(context).textTheme.displaySmall;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 80),
        ...widget.liveGame.currentResults.entries
            .map((e) => (name: e.key, score: e.value))
            .sorted((a, b) => -a.score.compareTo(b.score))
            .mapIndexed(
          (i, e) {
            final int lastRank = 1 +
                widget.lastResults.entries
                    .map((e) => (name: e.key, score: e.value))
                    .sorted((a, b) => -a.score.compareTo(b.score))
                    .indexWhere(
                      (element) => element.name == e.name,
                    );

            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: TweenAnimationBuilder<int>(
                tween: IntTween(
                  begin: lastRank,
                  end: i + 1,
                ),
                duration: const Duration(seconds: 1),
                builder: (context, v, _) {
                  return Text(
                    v.toString(),
                    style: displaySmall?.copyWith(color: Colors.green),
                  );
                },
              ),
              title: Text(
                e.name,
                style: displaySmall,
              ),
              trailing: TweenAnimationBuilder(
                tween: IntTween(
                    begin: widget.lastResults[e.name] ?? 0, end: e.score),
                duration: const Duration(seconds: 1),
                builder: (context, v, _) => Text(
                  v.toString(),
                  style: displaySmall,
                ),
              ),
            );
          },
        ).fold(
          [],
          // Add dividers between each player
          (value, element) => [
            ...value,
            if (value.isNotEmpty) const Divider(thickness: 4),
            element
          ],
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
