part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarState {}

class BottomNavigationBarInitialState extends BottomNavigationBarState {
  final int initialIndex;

  BottomNavigationBarInitialState({required this.initialIndex});
}

class BottomNavigationChangeState extends BottomNavigationBarState {
  final int currentIndex;

  BottomNavigationChangeState({required this.currentIndex});
}