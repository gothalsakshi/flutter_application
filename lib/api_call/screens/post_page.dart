import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/post_bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Post Page'),backgroundColor: Colors.white,),
      body: BlocBuilder<PostsBloc,PostsState>(builder: (ctx,state){
        if(state is LoadedPostsState){
          return ListView.builder(
            itemCount: state.postsList.length,
            itemBuilder: (ctx,index){
            return Container(
              color: Colors.green.shade200,
              margin: const EdgeInsets.all(15),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User Id :- ${state.postsList[index].userId.toString()}'),
                Text('Id :- ${state.postsList[index].id.toString()}'),
                Text('Title :-  ${state.postsList[index].title.toString()}'),
                Text('Body :- ${state.postsList[index].body.toString()}'),
              ],
            ),
            );
          });
        }else if(state is LoadingPostsState){
          return const Center(child: CircularProgressIndicator());
        }else{
          return Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.grey,
            child: Center(
              child: ElevatedButton(onPressed: (){
                context.read<PostsBloc>().add(LoadedPostsEvent());
              }, child: const Text('call Method')),
            ),
          );
        }
      }),
    );
  }
}