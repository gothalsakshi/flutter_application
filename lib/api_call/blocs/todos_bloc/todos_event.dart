part of 'todos_bloc.dart';

abstract class TodosEvent {}

class TodosLoadingEvent extends TodosEvent{
  final int userId;

  TodosLoadingEvent({required this.userId});
}

class TodosLoadedEvent extends TodosEvent{}