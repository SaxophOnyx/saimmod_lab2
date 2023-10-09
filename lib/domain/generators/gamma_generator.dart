import 'dart:math';

import 'sequence_generator.dart';

class GammaGenerator implements SequenceGenerator {
  final double k;
  final double theta;
  final Random random;

  GammaGenerator({
    required this.k,
    required this.theta,
    Random? random,
  }) : random = random ?? Random();

  @override
  List<double> get(int length) {
    final List<double> sequence = List<double>.filled(length, 0);

    for (int i = 0; i < length; ++i) {
      double a = 1;

      for (int j = 0; j < k; ++j) {
        a *= random.nextDouble();
      }

      final double x = -1 / theta * log(a);
      sequence[i] = x;
    }

    return sequence;
  }

  // @override
  // List<double> get(int length) {
  //   final List<double> sequence = List<double>.filled(length, 0);
  //
  //   for (int i = 0; i < length; ++i) {
  //     final double u = random.nextDouble();
  //     final double x = pow(-1 * log(1 - u), 1 / k) * lambda;
  //
  //     sequence[i] = x;
  //   }
  //
  //   return sequence;
  // }

  // @override
  // List<double> get(int length) {
  //   final List<double> sequence = List<double>.filled(length, 0);
  //
  //   for (int i = 0; i < length; ++i) {
  //     double sum = 0;
  //
  //     for (int j = 0; j < shape; ++j) {
  //       sum -= log(random.nextDouble());
  //     }
  //
  //     final double gamma = sum * scale;
  //     sequence[i] = gamma;
  //   }
  //
  //   return sequence;
  // }
}
