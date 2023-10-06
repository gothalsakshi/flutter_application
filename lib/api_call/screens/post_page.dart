import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/comment_bloc/comment_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/post_bloc/posts_bloc.dart';
import 'package:flutter_application_1/api_call/screens/comment_page.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is InternetConnectivityState ||
            state is WifiConnectivityState) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text('Post Page'),
              backgroundColor: Colors.white,
            ),
            body: BlocBuilder<PostsBloc, PostsState>(builder: (ctx, state) {
              if (state is LoadedPostsState) {
                return ListView.builder(
                    itemCount: state.postsList.length,
                    itemBuilder: (ctx, index) {
                      return InkWell(
                        onTap: () {
                          context.read<CommentBloc>().add(CommentLoadingEvent(
                              postId: state.postsList[index].id));
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => const CommentPage()));
                        },
                        child: Container(
                          color: Colors.green.shade200,
                          margin: const EdgeInsets.all(15),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'User Id :- ${state.postsList[index].userId.toString()}'),
                              Text(
                                  'Id :- ${state.postsList[index].id.toString()}'),
                              Text(
                                  'Title :-  ${state.postsList[index].title.toString()}'),
                              Text(
                                  'Body :- ${state.postsList[index].body.toString()}'),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (state is LoadingPostsState) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.grey);
              }
            }),
          );
        } else if (state is NoInternetConnectivityState) {
          return const Scaffold(
              body: Center(
                  child: Text(
            'Please check your internet connection',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )));
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
