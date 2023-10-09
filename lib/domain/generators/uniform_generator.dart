import 'sequence_generator.dart';

class UniformGenerator implements SequenceGenerator {
  final int a;
  final int m;
  final double min;
  final double max;
  final int seed;

  const UniformGenerator({
    required this.a,
    required this.m,
    required this.seed,
    this.min = 0,
    this.max = 1,
  });

  @override
  List<double> get(int length) {
    final List<double> res = List.filled(length, 0, growable: false);
    final double diff = max - min;
    double x = seed.toDouble();

    for (int i = 0; i < res.length; ++i) {
      res[i] = (x / m) * diff + min;
      x = (a * x) % m;
    }

    return res;
  }
}
