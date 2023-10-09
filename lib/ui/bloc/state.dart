part of 'bloc.dart';

class LabState {
  final List<int> ranges;
  final SequenceMath math;
  final List<String> generators;
  final int activeGeneratorIndex;

  const LabState.initial()
      : ranges = const <int>[],
        math = const SequenceMath.empty(),
        generators = const <String>[],
        activeGeneratorIndex = -1;

  LabState({
    required List<int> ranges,
    required this.math,
    required List<String> generators,
    required this.activeGeneratorIndex,
  })  : ranges = [...ranges],
        generators = [...generators];

  LabState copyWith({
    List<int>? ranges,
    SequenceMath? math,
    List<String>? generators,
    int? activeGeneratorIndex,
  }) {
    return LabState(
      ranges: ranges ?? this.ranges,
      math: math ?? this.math,
      generators: generators ?? this.generators,
      activeGeneratorIndex: activeGeneratorIndex ?? this.activeGeneratorIndex,
    );
  }
}
