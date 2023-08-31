part of 'dummy_bloc.dart';

@immutable
abstract class DummyEvent {}

class DummyCounterIncrementEvent extends DummyEvent{}

class DummyCounterDecrementEvent extends DummyEvent{}
