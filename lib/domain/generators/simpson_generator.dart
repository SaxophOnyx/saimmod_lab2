import 'dart:math';

import 'sequence_generator.dart';

class SimpsonGenerator extends SequenceGenerator {
  final double a;
  final double b;
  final double c;
  final Random random;

  SimpsonGenerator({
    required this.a,
    required this.b,
    required this.c,
    Random? random,
  }) : random = random ?? Random();

  @override
  List<double> get(int length) {
    final List<double> sequence = List<double>.filled(length, 0);

    for (int i = 0; i < length; ++i) {
      final double u = Random().nextDouble();
      late double x;

      if (u <= (c - a) / (b - a)) {
        x = a + sqrt(u * (b - a) * (c - a));
      } else {
        x = b - sqrt((1 - u) * (b - a) * (b - c));
      }

      sequence[i] = x;
    }

    return sequence;
  }
}
