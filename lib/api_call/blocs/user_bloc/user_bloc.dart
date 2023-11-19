import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/user_model.dart';
import 'package:flutter_application_1/api_call/repositories/user_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadingUserDataEvent>(gettingUserData);
  }
  int page = 1;
   void gettingUserData(LoadingUserDataEvent event,Emitter<UserState>emit)async{
    
    if(state is LoadingUserDataState) return;

    final currentState = state;
    var oldData = <UserModel>[];
    if(currentState is LoadedUserDataState){
      oldData = currentState.oldUserList;
    }

    emit(LoadingUserDataState(userList: oldData,isFirstFetch: page == 1));
    final users = (state as LoadingUserDataState).userList;
    await UserRepo().getUserList(page).then((value) {
      page++;
      final users = (state as LoadingUserDataState).userList;
      users.addAll(value);
      debugPrint('checking the page number--->{$page}');
      return users;
    });
    emit(LoadedUserDataState(oldUserList: users));
    // userRepoData.clear();
  }
}
