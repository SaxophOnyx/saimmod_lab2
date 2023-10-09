import 'package:flutter/material.dart';
import 'package:lab_1/domain/domain.dart';

import '../labeled_text.dart';

class HorizontalMathDisplay extends StatelessWidget {
  final SequenceMath data;
  final EdgeInsets padding;

  const HorizontalMathDisplay({
    super.key,
    required this.data,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          LabeledText(
            label: 'Мат. ожидание:',
            text: data.mean.toStringAsFixed(5),
          ),
          LabeledText(
            label: 'Дисперсия:',
            text: data.variance.toStringAsFixed(5),
          ),
          LabeledText(
            label: 'Среднекв. отклонение:',
            text: data.sigma.toStringAsFixed(5),
          ),
        ],
      ),
    );
  }
}
