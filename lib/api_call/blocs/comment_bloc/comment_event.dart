part of 'comment_bloc.dart';

@immutable
abstract class CommentEvent {}

class CommentLoadingEvent extends CommentEvent{
  final int userId;

  CommentLoadingEvent({required this.userId});
}

class CommentLoadedEvent extends CommentEvent{}