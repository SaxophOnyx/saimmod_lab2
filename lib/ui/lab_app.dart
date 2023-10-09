import 'package:flutter/material.dart';
import 'package:lab_1/ui/lab_screen.dart';

class LabApp extends StatelessWidget {
  const LabApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LabScreen(),
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.indigo,
        ),
      ),
    );
  }
}
