part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LoadingUserDataState extends UserState{}

class LoadedUserDataState extends UserState{
  final List<UserModel> userList;

  LoadedUserDataState({required this.userList});
}

class UserLoadingSuccessState extends UserState{}