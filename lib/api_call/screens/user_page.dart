import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/album_bloc/album_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/post_bloc/posts_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/todos_bloc/todos_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api_call/model/user_model.dart';
import 'package:flutter_application_1/api_call/screens/album_page.dart';
import 'package:flutter_application_1/api_call/screens/post_page.dart';
import 'package:flutter_application_1/api_call/screens/todos_page.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // final CommentBloc comentBloc = CommentBloc();

  final scrollController = ScrollController();

  void setupScrollController(){
    scrollController.addListener(() { 
      if(scrollController.position.atEdge){
        if(scrollController.position.pixels != 0){
          context.read<UserBloc>().add(LoadingUserDataEvent());
        }
      }
    });
  }

  @override
  void initState() {
    context.read<UserBloc>().add(LoadingUserDataEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    setupScrollController();
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is InternetConnectivityState ||
            state is WifiConnectivityState) {
          return Scaffold(
            appBar: AppBar(title: const Text('User Page')),
            body: BlocBuilder<UserBloc, UserState>(builder: (ctx, state) {
              List<UserModel> users = [];
              bool isLoading = false;
              if(state is LoadingUserDataState  && state.isFirstFetch){
                return const Center(child: CircularProgressIndicator());
              } 
              if (state is LoadedUserDataState) {
                users = state.oldUserList;
                return ListView.builder(
                    controller: scrollController,
                    itemCount: users.length + (isLoading == true ? 1 : 0),
                    itemBuilder: (ctx, index) {
                      if(index < state.oldUserList.length){
                        return Container(
                        color: Colors.amber.shade100,
                        margin: const EdgeInsets.all(12),
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'User Id :- ${users[index].id.toString()}'),
                            Text(
                                'User Name :- ${users[index].name.toString()}'),
                            Text(
                                'User PhoneNumber :- ${users[index].phone.toString()}'),
                            Text(
                                'User Email :- ${users[index].email.toString()}'),
                            Text(
                                'User Company Name :- ${users[index].company!.name.toString()}'),
                            Text(
                                'User City Name :- ${users[index].address!.city.toString()}'),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    context.read<PostsBloc>().add(
                                        LoadingPostsEvent(
                                            userId: users[index].id!));
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const PostPage()));
                                  },
                                  child: Chip(
                                      color: MaterialStatePropertyAll(
                                          Colors.deepOrange.shade100),
                                      label: const Text('Posts')),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<AlbumBloc>().add(
                                        AlbumLoadingEvent(
                                            userId: state.oldUserList[index].id!));
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const AlbumPage()));
                                  },
                                  child: Chip(
                                      color: MaterialStatePropertyAll(
                                          Colors.deepOrange.shade200),
                                      label: const Text('Albums')),
                                ),
                                InkWell(
                                  onTap: () {
                                    context.read<TodosBloc>().add(
                                        TodosLoadingEvent(
                                            userId: state.oldUserList[index].id!));
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (ctx) =>
                                                const TodosPage()));
                                  },
                                  child: Chip(
                                      color: MaterialStatePropertyAll(
                                          Colors.deepOrange.shade300),
                                      label: const Text('Todos')),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                      }else{
                        return const Center(child: CircularProgressIndicator());
                      }
                    });
              } else if (state is LoadingUserDataState) {
                // setState(() {
                  users = state.userList;
                  isLoading = true;
                // });
                return const Center(child: CircularProgressIndicator());
              } else {
                return Container(
                  color: Colors.black,
                  // child: FloatingActionButton(onPressed: (){
                  //   context.read<UserBloc>().add(LoadingUserDataEevnt());
                  // }),
                );
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
