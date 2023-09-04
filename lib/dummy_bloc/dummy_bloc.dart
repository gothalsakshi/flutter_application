import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'dummy_event.dart';
part 'dummy_state.dart';

class DummyBloc extends Bloc<DummyEvent, DummyState> {
  int dummyCounter = 0;
  bool checkValue = false;
  DummyBloc() : super(DummyInitial()) {
    on<DummyEvent>((event, emit) {
      if(event is DummyCounterIncrementEvent){
        dummyCounter++;
        debugPrint('here is counte--->$dummyCounter');
        emit(DummyCounterIncrementState(counter: dummyCounter));
      }else if(event is DummyCounterDecrementEvent){
        dummyCounter--;
        debugPrint('here is counte--->$dummyCounter');
        emit(DummyCounterDecrementState(counter: dummyCounter));
      }else if(event is CheckBoxUpdateEvent){
        checkValue =! checkValue;
        debugPrint('updated check value is --->$checkValue');
        emit(CheckBoxUpdateState(checkValue: checkValue));
      }
    });
  }
}
