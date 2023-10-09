import 'package:flutter/material.dart';

import '../chart/chart.dart';

class RangesDisplay extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final List<int> ranges;

  const RangesDisplay({
    super.key,
    this.padding = EdgeInsets.zero,
    required this.ranges,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: padding,
      child: Column(
        children: [
          Text(
            'График плотности распределения',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          Flexible(
            child: Chart(
              items: ranges,
              spacerWidth: 2,
              textTopIndent: 80,
              bottomThickness: 6,
              indent: 12,
            ),
          ),
        ],
      ),
    );
  }
}
