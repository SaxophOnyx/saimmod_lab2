import 'dart:math';

import 'sequence_generator.dart';

class NormalGenerator implements SequenceGenerator {
  final double mu;
  final double sigma;
  final Random random;

  NormalGenerator({
    required this.mu,
    required this.sigma,
    Random? random,
  }) : random = random ?? Random();

  @override
  List<double> get(int length) {
    final List<double> sequence = List<double>.filled(length, 0);

    for (int i = 0; i < length; ++i) {
      final double u1 = random.nextDouble();
      final double u2 = random.nextDouble();
      final double z = sqrt(-2 * log(u1)) * cos(2 * pi * u2);
      final double x = mu + z * sigma;

      sequence[i] = x;
    }

    return sequence;
  }
}
