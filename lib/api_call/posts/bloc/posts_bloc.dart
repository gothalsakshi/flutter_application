
import 'package:flutter_application_1/api_call/posts/model/posts_response_model.dart';
import 'package:flutter_application_1/api_call/posts/repos/posts_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
     on<PostsEvent>(postsInitialFetchEvent);
  }

  Future<void> postsInitialFetchEvent(
      PostsEvent event, Emitter<PostsState> emit) async {
    emit(LoadingPostsState());
    List<PostDataUiModel> posts = await PostsRepo().getPostList();

    emit(LoadedPostsState(postsList: posts));
  }
}
