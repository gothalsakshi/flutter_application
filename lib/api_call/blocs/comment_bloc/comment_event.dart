part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class CommentLoadingEvent extends CommentEvent{
  final int postId;

  CommentLoadingEvent({required this.postId});
}

class CommentLoadedEvent extends CommentEvent{}