import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/album_bloc/album_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/post_bloc/posts_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/todos_bloc/todos_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api_call/screens/album_page.dart';
import 'package:flutter_application_1/api_call/screens/post_page.dart';
import 'package:flutter_application_1/api_call/screens/todos_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // final CommentBloc comentBloc = CommentBloc();
  
  @override
  void initState() {
    context.read<UserBloc>().add(LoadingUserDataEevnt());
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Page')),
      body: BlocBuilder<UserBloc,UserState>(builder: (ctx,state){
        if(state is LoadedUserDataState){
          return ListView.builder(
            itemCount: state.userList.length,
            itemBuilder: (ctx,index){
            return Container(
              color: Colors.amber.shade100,
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User Id :- ${state.userList[index].id.toString()}'),
                  Text('User Name :- ${state.userList[index].name.toString()}'),
                  Text('User PhoneNumber :- ${state.userList[index].phone.toString()}'),
                  Text('User Email :- ${state.userList[index].email.toString()}'),
                  Text('User Company Name :- ${state.userList[index].company!.name.toString()}'),
                  Text('User City Name :- ${state.userList[index].address!.city.toString()}'),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          context.read<PostsBloc>().add(LoadingPostsEvent(userId: state.userList[index].id!));
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const PostPage()));
                        } ,
                        child: Chip(
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade100),
                          label: const Text('Posts')),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<AlbumBloc>().add(AlbumLoadingEvent(userId: state.userList[index].id!));
                          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const AlbumPage()));
                        } ,
                        child: Chip(
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade200),
                          label: const Text('Albums')),
                      ),
                      InkWell(
                        onTap: () {
                          context.read<TodosBloc>().add(TodosLoadingEvent(userId: state.userList[index].id!));
                          Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const TodosPage()));
                        } ,
                        child: Chip(
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade300),
                          label: const Text('Todos')),
                      )
                    ],
                  )
                ],
              ),
            );
          });
        }else if(state is LoadingUserDataState){
          return const Center(child: CircularProgressIndicator());
        }else{
          return Container(
            color: Colors.black,
            // child: FloatingActionButton(onPressed: (){
            //   context.read<UserBloc>().add(LoadingUserDataEevnt());
            // }),
          );
        }
      }),
    );
  }
}