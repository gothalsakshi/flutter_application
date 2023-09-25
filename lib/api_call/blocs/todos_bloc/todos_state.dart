part of 'todos_bloc.dart';

@immutable
abstract class TodosState {}

class TodosInitial extends TodosState {}

class TodosLoadingState extends TodosState{}

class TodosLoadedState extends TodosState{
  final List<TodosModel> todosList;

  TodosLoadedState({required this.todosList});
}