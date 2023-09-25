import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/comment_bloc/comment_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({super.key});

  @override
  State<CommentPage> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentPage> {
  
  // final commentBloc = CommentBloc();

  @override
  void initState() {
    super.initState();
    // context.read<CommentBloc>().add(CommentLoadingEvent());

    // debugPrint('user id in init state-->${commentBloc.userId}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Comment Page')),
      body: BlocBuilder<CommentBloc,CommentState>(builder: (ctx,state){
        if(state is CommentLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else if(state is CommentLoadedState){
          return ListView.builder(
            itemCount: state.commentList.length,
            itemBuilder: (ctx,index){
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Colors.pinkAccent,
              child: Column(
                children: [
                  Text(state.commentList[index].postId.toString()),
                  Text(state.commentList[index].id.toString()),
                  Text(state.commentList[index].name.toString()),
                  Text(state.commentList[index].email.toString()),
                  Text(state.commentList[index].body.toString()),
                ],
              ),
            );
          });
        }else{
          return Container(
            height: 50,width: 50,color: Colors.grey,
          );
        }
      })
    );
  }
}