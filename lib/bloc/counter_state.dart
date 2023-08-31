part of 'counter_bloc.dart';

abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterIncrementState extends CounterState{}

class CounterDcrementState extends CounterState{}
