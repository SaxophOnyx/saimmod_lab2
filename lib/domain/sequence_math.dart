class SequenceMath {
  final double mean;
  final double variance;
  final double sigma;

  const SequenceMath({
    required this.mean,
    required this.variance,
    required this.sigma,
  });

  const SequenceMath.empty()
      : mean = 0.0,
        variance = 0.0,
        sigma = 0.0;
}
