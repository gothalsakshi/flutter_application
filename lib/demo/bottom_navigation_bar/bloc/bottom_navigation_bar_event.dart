part of 'bottom_navigation_bar_bloc.dart';

abstract class BottomNavigationBarEvent {}

class BottomNavigationInitialEvent extends BottomNavigationBarEvent{}

class BottomNavigationChangeEvent extends BottomNavigationBarEvent{
  final int currentIndex;

  BottomNavigationChangeEvent({required this.currentIndex});
}
