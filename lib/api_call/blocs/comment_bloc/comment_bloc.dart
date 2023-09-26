import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/comment_model.dart';
import 'package:flutter_application_1/api_call/repositories/comments_repo.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  CommentBloc() : super(CommentInitial()) {
    on<CommentLoadingEvent>(commentsFetch);
  }

  Future<void> commentsFetch(
    CommentLoadingEvent event, Emitter<CommentState> emit) async {
    emit(CommentLoadingState());
    List<CommentModel> comments = await CommentRepo().getUserComments(event.postId);
    debugPrint('in bloc file--->${event.postId.toString()}');
    emit(CommentLoadedState(commentList: comments));
  }
}
