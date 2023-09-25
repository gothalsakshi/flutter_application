part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class LoadingUserDataEevnt extends UserEvent{}

class LoadedUserDataEvent extends UserEvent{}

class UserLoadingSuccessEvent extends UserEvent{}