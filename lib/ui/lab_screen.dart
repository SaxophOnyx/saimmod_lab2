import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_1/domain/domain.dart';
import 'package:lab_1/domain/generators/simpson_generator.dart';

import 'bloc/bloc.dart';
import 'lab_form.dart';

class LabScreen extends StatelessWidget {
  const LabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LabBloc(
        generators: [
          const UniformGenerator(
            a: 102191,
            m: 203563,
            seed: 12345,
            min: 10,
            max: 19,
          ),
          GammaGenerator(
            k: 8,
            theta: 3,
          ),
          NormalGenerator(
            mu: 5,
            sigma: 0.15,
          ),
          ExponentialGenerator(
            lambda: 3,
          ),
          TriangularGenerator(
            a: 0,
            b: 9,
          ),
          SimpsonGenerator(
            a: 0,
            b: 10,
            c: 5,
          ),
        ],
        analyzer: Analyzer(),
      )..add(const Initialize()),
      child: const LabForm(),
    );
  }
}
