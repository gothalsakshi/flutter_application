import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/api_call/posts/model/posts_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
part 'posts_event.dart';
part 'posts_state.dart';

class PostsBloc extends Bloc<PostsEvent, PostsState> {
  PostsBloc() : super(PostsInitial()) {
    // on<PostsEvent>((event, emit) {
      
    // });
  apiCall();
    
  }
  void apiCall()async{
    final  client = http.Client();
    List<PostsResponseModel> postsList = [];
    bool loading = false;
      try {
       if(state is LoadedPostsState){
         var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        for (var i = 0; i < response.body.length ; i++) {
          postsList.add(response.body[i] as PostsResponseModel);
        }
       }else if(state is LoadingPostsState){
          
       }
        debugPrint('here is list -->${postsList.toString()}');
      } catch (e) {
        debugPrint(e.toString());
      }
    }
}
