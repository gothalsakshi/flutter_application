import 'package:bloc/bloc.dart';
import 'package:flutter_application_1/api_call/users/model/user_model.dart';
import 'package:flutter_application_1/api_call/users/repos/user_repo.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserInitial()) {
    on<LoadingUserDataEevnt>(gettingUserData);
  }

  Future<void> gettingUserData(LoadingUserDataEevnt event,Emitter<UserState>emit)async{
    emit(LoadingUserDataState());
    List<UserModel> userRepoData = await UserRepo().getUserList();
    emit(LoadedUserDataState(userList: userRepoData));
  }
}
