import 'package:flutter/material.dart';

class ChartBottom extends StatelessWidget {
  final double thickness;
  final Color color;

  const ChartBottom({
    super.key,
    required this.thickness,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: thickness,
    );
  }
}
