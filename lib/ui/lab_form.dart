import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';
import './widgets/widgets.dart';

class LabForm extends StatelessWidget {
  const LabForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const LabAppBar(),
      body: BlocBuilder<LabBloc, LabState>(
        builder: (BuildContext context, LabState state) {
          return Row(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 6,
                        child: RangesDisplay(
                          ranges: state.ranges,
                          padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                        ),
                      ),
                      Expanded(
                        child: HorizontalMathDisplay(
                          data: state.math,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const AppDivider.vertical(),
              Expanded(
                child: GeneratorsDisplay(
                  generators: state.generators,
                  selectedGeneratorIndex: state.activeGeneratorIndex,
                  onSelectedGeneratorChanged: (int index) {
                    context.read<LabBloc>().add(SelectActiveGenerator(index));
                  },
                  padding: const EdgeInsets.all(16),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
