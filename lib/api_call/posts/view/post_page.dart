import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/posts/bloc/posts_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Post Page')),
      body: BlocBuilder<PostsBloc,PostsState>(builder: (ctx,state){
        return Container(color: Colors.red,);
      }),
    );
  }
}