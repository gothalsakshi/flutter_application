import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/comment_bloc/comment_bloc.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is InternetConnectivityState ||
            state is WifiConnectivityState) {
          return Scaffold(
              appBar: AppBar(title: const Text('Comment Page')),
              body:
                  BlocBuilder<CommentBloc, CommentState>(builder: (ctx, state) {
                if (state is CommentLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is CommentLoadedState) {
                  return ListView.builder(
                      itemCount: state.commentList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.all(10),
                          color: Color.fromARGB(255, 229, 164, 186),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Post ID :- ${state.commentList[index].postId.toString()}'),
                              Text(
                                  'Comment ID :- ${state.commentList[index].id.toString()}'),
                              Text(
                                  'User Name :- ${state.commentList[index].name!}'),
                              Text(
                                  'User Email :- ${state.commentList[index].email.toString()}'),
                              Text(
                                  'Comment Body :- ${state.commentList[index].body.toString()}'),
                            ],
                          ),
                        );
                      });
                } else {
                  return Container(
                    height: 50,
                    width: 50,
                    color: Colors.grey,
                  );
                }
              }));
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
