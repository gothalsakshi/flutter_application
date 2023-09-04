part of 'dummy_bloc.dart';

@immutable
abstract class DummyState {}

class DummyInitial extends DummyState {}

class DummyCounterIncrementState extends DummyState{
  final int counter;

  DummyCounterIncrementState({required this.counter});
}

class DummyCounterDecrementState extends DummyState{
  final int counter;

  DummyCounterDecrementState({required this.counter});
}

class CheckBoxUpdateState extends DummyState{
  final bool checkValue;

  CheckBoxUpdateState({required this.checkValue});
}
