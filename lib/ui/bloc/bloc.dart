import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lab_1/domain/generators/simpson_generator.dart';

import '../../domain/domain.dart';

part 'events.dart';
part 'state.dart';

class LabBloc extends Bloc<LabEvent, LabState> {
  final Analyzer analyzer;
  final List<SequenceGenerator> generators;

  LabBloc({
    required this.analyzer,
    required this.generators,
  }) : super(const LabState.initial()) {
    on<Initialize>(_onInitialize);
    on<SelectActiveGenerator>(_onSelectActiveGenerator);
  }

  Future<void> _onInitialize(
    Initialize event,
    Emitter<LabState> emitter,
  ) async {
    emitter(state.copyWith(
      generators: generators
          .map((SequenceGenerator g) => _getGeneratorName(g.runtimeType))
          .toList(),
    ));
  }

  Future<void> _onSelectActiveGenerator(
    SelectActiveGenerator event,
    Emitter<LabState> emitter,
  ) async {
    final List<double> seq = generators[event.index].get(30000);
    final List<int> ranges = analyzer.getRanges(seq, 20);
    final SequenceMath math = analyzer.getMath(seq);

    emitter(state.copyWith(
      ranges: ranges,
      math: math,
      activeGeneratorIndex: event.index,
    ));
  }

  String _getGeneratorName(Type generatorType) {
    switch (generatorType) {
      case ExponentialGenerator:
        return 'Экспоненциальное распределение';
      case GammaGenerator:
        return 'Гамма-распределение';
      case SimpsonGenerator:
        return 'Распределение Симпсона';
      case TriangularGenerator:
        return 'Треугольное распределение';
      case UniformGenerator:
        return 'Равномерное распределение';
      case NormalGenerator:
        return 'Нормальное распределение';
      default:
        throw Error();
    }
  }
}
