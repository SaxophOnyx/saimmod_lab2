import 'package:flutter/material.dart';

import '../toggle_button.dart';

class GeneratorsDisplay extends StatelessWidget {
  final List<String> generators;
  final int selectedGeneratorIndex;
  final void Function(int) onSelectedGeneratorChanged;
  final EdgeInsets padding;

  const GeneratorsDisplay({
    super.key,
    required this.generators,
    required this.selectedGeneratorIndex,
    required this.onSelectedGeneratorChanged,
    this.padding = EdgeInsets.zero,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      color: const Color.fromARGB(255, 244, 244, 244),
      child: ListView.separated(
        itemCount: generators.length,
        itemBuilder: (BuildContext context, int i) {
          return ToggleButton(
            isActive: i == selectedGeneratorIndex,
            onPressed: () => onSelectedGeneratorChanged(i),
            text: generators[i],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
      ),
    );
  }
}
