part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoadingState extends CommentState{}

class CommentLoadedState extends CommentState{
  final List<CommentModel> commentList;

  CommentLoadedState({required this.commentList});
}

class CommentError extends CommentState{
  final String errorMessage;

  CommentError({required this.errorMessage});
}