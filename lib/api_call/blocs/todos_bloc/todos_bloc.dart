
import 'package:flutter_application_1/api_call/model/todos_model.dart';
import 'package:flutter_application_1/api_call/repositories/todos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'todos_event.dart';
part 'todos_state.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  TodosBloc() : super(TodosInitial()) {
    on<TodosLoadingEvent>(todosFetch);
  }

  Future<void> todosFetch(TodosLoadingEvent event,Emitter<TodosState> emit)async{
    emit(TodosLoadingState());
    List<TodosModel> todosList = await TodosRepo().getUserTodosList(event.userId);
    emit(TodosLoadedState(todosList: todosList));
  }
}
