import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  final VoidCallback onPressed;
  final bool isActive;
  final String text;

  const ToggleButton({
    super.key,
    required this.isActive,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    const Duration animationDuration = Duration(milliseconds: 200);
    final color = isActive ? Colors.indigoAccent : Colors.indigo;

    return GestureDetector(
      onTap: () {
        if (!isActive) {
          onPressed();
        }
      },
      child: TweenAnimationBuilder<Color?>(
        tween: ColorTween(
          begin: color,
          end: color,
        ),
        duration: animationDuration,
        builder: (BuildContext context, Color? value, Widget? child) {
          return Container(
            constraints: const BoxConstraints(minHeight: 40),
            decoration: BoxDecoration(
              color: value,
              border: Border.all(
                color: Colors.indigo,
              ),
            ),
            alignment: Alignment.center,
            child: child,
          );
        },
        child: AnimatedDefaultTextStyle(
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: isActive ? Colors.white : Colors.white,
              ),
          duration: animationDuration,
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
