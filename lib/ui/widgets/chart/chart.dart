import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lab_1/ui/widgets/chart/chart_bar.dart';
import 'package:lab_1/ui/widgets/chart/chart_bottom.dart';

class Chart extends StatelessWidget {
  final List<int> items;
  final double spacerWidth;
  final double indent;
  final double textTopIndent;
  final double bottomThickness;
  final int _max;

  Chart({
    super.key,
    required this.items,
    required this.spacerWidth,
    required this.indent,
    required this.textTopIndent,
    required this.bottomThickness,
  }) : _max = items.isEmpty ? 0 : items.reduce(max);

  @override
  Widget build(BuildContext context) {
    final ChartBottom bottom = ChartBottom(
      thickness: bottomThickness,
      color: Colors.indigo.shade700,
    );

    if (items.isEmpty) {
      return Align(
        alignment: Alignment.bottomCenter,
        child: bottom,
      );
    }

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints c) {
        final availableHeight = c.maxHeight - bottomThickness;
        final availableWidth = c.maxWidth - indent * 2;
        final double barWidth =
            (availableWidth - ((items.length - 1) * spacerWidth)) /
                items.length;

        return Column(
          verticalDirection: VerticalDirection.up,
          children: <Widget>[
            bottom,
            Padding(
              padding: EdgeInsets.symmetric(horizontal: indent),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: c.minHeight,
                  minWidth: c.minWidth,
                  maxWidth: availableWidth,
                  maxHeight: availableHeight,
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, int i) {
                    return ChartBar(
                      color: i % 2 == 0 ? Colors.indigo : Colors.indigoAccent,
                      height:
                          (availableHeight - textTopIndent) * (items[i] / _max),
                      width: barWidth,
                      label: items[i].toString(),
                    );
                  },
                  separatorBuilder: (_, __) => SizedBox(width: spacerWidth),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
