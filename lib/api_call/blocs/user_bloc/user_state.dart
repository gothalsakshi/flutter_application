part of 'user_bloc.dart';

@immutable
abstract class UserState {}

class UserInitial extends UserState {}

class LoadingUserDataState extends UserState{
  final List<UserModel> userList;
  final bool isFirstFetch;

  LoadingUserDataState({required this.userList, required this.isFirstFetch});
}

class LoadedUserDataState extends UserState{
  final List<UserModel> oldUserList;

  LoadedUserDataState({required this.oldUserList});
}

class UserLoadingSuccessState extends UserState{}