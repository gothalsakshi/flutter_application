part of 'list_functions_cubit.dart';

abstract class ListFunctionsState {}

class ListFunctionsInitial extends ListFunctionsState {}

class EmptyListState extends ListFunctionsState{
  final List list;
  EmptyListState({required this.list});
}

class ListAddState extends ListFunctionsState{
  final List list;
  ListAddState({required this.list});
}

class ListRemoveState extends ListFunctionsState{
  final List list;
  ListRemoveState({required this.list});
}
