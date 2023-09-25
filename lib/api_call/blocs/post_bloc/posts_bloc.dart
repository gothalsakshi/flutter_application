
import 'package:flutter_application_1/api_call/model/posts_response_model.dart';
import 'package:flutter_application_1/api_call/repositories/posts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
     on<LoadingPostsEvent>(postsInitialFetchEvent);
  }

  Future<void> postsInitialFetchEvent(
      LoadingPostsEvent event, Emitter<PostsState> emit) async {
    emit(LoadingPostsState());
    List<PostDataUiModel> posts = await PostsRepo().getPostList(event.userId);

    emit(LoadedPostsState(postsList: posts));
  }
}
