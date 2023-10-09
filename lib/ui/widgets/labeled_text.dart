import 'package:flutter/material.dart';

class LabeledText extends StatelessWidget {
  final String text;
  final String label;

  const LabeledText({
    super.key,
    required this.text,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            label,
            textAlign: TextAlign.left,
            maxLines: 2,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            text,
            textAlign: TextAlign.center,
            maxLines: 4,
            style: theme.textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
