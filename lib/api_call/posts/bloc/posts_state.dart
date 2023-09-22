part of 'posts_bloc.dart';


abstract class PostsState {}

class PostsInitial extends PostsState {}

class LoadingPostsState extends PostsState{}

class LoadedPostsState extends PostsState{
  final List<PostDataUiModel> postsList;
  LoadedPostsState({required this.postsList});
}

class LoadingSuccessState extends PostsState{}