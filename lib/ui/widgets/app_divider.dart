import 'package:flutter/material.dart';

class AppDivider extends StatelessWidget {
  final bool _isVertical;

  const AppDivider.vertical({super.key}) : _isVertical = true;

  const AppDivider.horizontal({super.key}) : _isVertical = false;

  @override
  Widget build(BuildContext context) {
    if (_isVertical) {
      return const VerticalDivider(
        color: Colors.grey,
        thickness: 1,
        width: 1,
        indent: 0,
        endIndent: 0,
      );
    }

    return const Divider(
      color: Colors.grey,
      thickness: 1,
      height: 1,
      indent: 0,
      endIndent: 0,
    );
  }
}
