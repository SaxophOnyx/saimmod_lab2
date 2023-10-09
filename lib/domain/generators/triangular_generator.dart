import 'dart:math';

import 'sequence_generator.dart';

class TriangularGenerator implements SequenceGenerator {
  final double a;
  final double b;
  final Random random;

  TriangularGenerator({
    required this.a,
    required this.b,
    Random? random,
  }) : random = random ?? Random();

  @override
  List<double> get(int length) {
    final List<double> sequence = List<double>.filled(length, 0);

    for (int i = 0; i < length; ++i) {
      final double u = Random().nextDouble();
      final double v = Random().nextDouble();
      final double x = a + ((b - a) * max(u, v));
      sequence[i] = x;
    }

    return sequence;
  }

  // @override
  // List<double> get(int length) {
  //   final List<double> sequence = List<double>.filled(length, 0);
  //   final double c = (b - a) / 2;
  //
  //   for (int i = 0; i < length; ++i) {
  //     final double u = Random().nextDouble();
  //     // final double x = a + u * (b - a);
  //     final double x = a + sqrt(u * (b - a) * (c - a));
  //     sequence[i] = x;
  //   }
  //
  //   return sequence;
  // }
}
