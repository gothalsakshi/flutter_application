import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  // final UserBloc bloc = UserBloc();
  
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
                        onTap: () {} ,
                        child: Chip(padding: const EdgeInsets.all(4),
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade100),
                          labelPadding: const EdgeInsets.all(0),
                          label: const Text('Posts')),
                      ),
                      InkWell(
                        onTap: () {} ,
                        child: Chip(padding: const EdgeInsets.all(4),
                          labelPadding: const EdgeInsets.all(0),
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade200),
                          label: const Text('Comments')),
                      ),
                      InkWell(
                        onTap: () {} ,
                        child: Chip(padding: const EdgeInsets.all(4),
                          labelPadding: const EdgeInsets.all(0),
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade300),
                          label: const Text('Albums')),
                      ),
                      InkWell(
                        onTap: () {} ,
                        child: Chip(padding: const EdgeInsets.all(4),
                          labelPadding: const EdgeInsets.all(0),
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade400),
                          label: const Text('Photos')),
                      ),
                      InkWell(
                        onTap: () {} ,
                        child: Chip(padding: const EdgeInsets.all(4),
                          labelPadding: const EdgeInsets.all(0),
                          color: MaterialStatePropertyAll(Colors.deepOrange.shade500),
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