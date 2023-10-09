part of 'bloc.dart';

abstract class LabEvent {
  const LabEvent();
}

class Initialize extends LabEvent {
  const Initialize();
}

class SelectActiveGenerator extends LabEvent {
  final int index;

  const SelectActiveGenerator(this.index);
}
