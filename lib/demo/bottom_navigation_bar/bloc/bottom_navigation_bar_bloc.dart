import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
  int currentIndex = 0;
  BottomNavigationBarBloc() : super(BottomNavigationBarInitialState(initialIndex: 0)) {
    on<BottomNavigationBarEvent>((event, emit) {
      if(event is BottomNavigationChangeEvent){
        currentIndex = event.currentIndex;
        emit(BottomNavigationChangeState(currentIndex: currentIndex));
        debugPrint("checking index--->$currentIndex");
      }
    });
  }
}
