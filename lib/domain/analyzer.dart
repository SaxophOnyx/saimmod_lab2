import 'dart:math';

import 'sequence_math.dart';

class Analyzer {
  SequenceMath getMath(List<double> sequence) {
    final double mean = sequence.reduce((sum, e) => sum + e) / sequence.length;
    final double variance =
        sequence.reduce((sum, e) => sum + pow((e - mean), 2)) / sequence.length;
    final double sigma = sqrt(variance);

    return SequenceMath(
      mean: mean,
      variance: variance,
      sigma: sigma,
    );
  }

  List<int> getRanges(List<double> sequence, int count) {
    final double sMin = sequence.reduce(min);
    final double sMax = sequence.reduce(max);
    final double step = (sMax - sMin) / count;

    final List<int> ranges = List<int>.filled(count, 0);

    for (int i = 0; i < sequence.length; ++i) {
      int index = ((sequence[i] - sMin) / step).floor();

      if (index == ranges.length) {
        index = ranges.length - 1;
      }

      ranges[index]++;
    }

    return ranges;
  }
}
