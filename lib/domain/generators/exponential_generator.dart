import 'dart:math';

import 'sequence_generator.dart';

class ExponentialGenerator implements SequenceGenerator {
  final double lambda;
  final Random random;

  ExponentialGenerator({
    required this.lambda,
    Random? random,
  }) : random = random ?? Random();

  @override
  List<double> get(int length) {
    final List<double> sequence = List<double>.filled(length, 0);

    for (int i = 0; i < length; ++i) {
      final double u = Random().nextDouble();
      final double x = -log(1 - u) / lambda;
      sequence[i] = x;
    }

    return sequence;
  }
}
