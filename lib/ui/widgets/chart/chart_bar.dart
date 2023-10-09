import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final Color color;
  final double height;
  final double width;
  final String label;

  const ChartBar({
    super.key,
    required this.color,
    required this.height,
    required this.width,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RotatedBox(
          quarterTurns: 3,
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.labelLarge,
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 10),
        TweenAnimationBuilder(
          tween: Tween<double>(begin: 0, end: height),
          duration: const Duration(milliseconds: 500),
          builder: (BuildContext context, double value, Widget? child) {
            return Container(
              color: color,
              width: width,
              height: value,
              child: child,
            );
          },
        ),
      ],
    );
  }
}
