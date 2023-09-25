part of 'posts_bloc.dart';

abstract class PostsEvent {}

class LoadingPostsEvent extends PostsEvent{}

class LoadedPostsEvent extends PostsEvent{}

class LoadingSuccessEvent extends PostsEvent{}
