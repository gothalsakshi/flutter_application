part of 'posts_bloc.dart';

abstract class PostsEvent {}

class LoadingPostsEvent extends PostsEvent{
  final int userId;

  LoadingPostsEvent({required this.userId});
}

class LoadedPostsEvent extends PostsEvent{}

class LoadingSuccessEvent extends PostsEvent{}
