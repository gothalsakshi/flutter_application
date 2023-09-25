import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/todos_bloc/todos_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos Page')),
      body: BlocBuilder<TodosBloc,TodosState>(builder: (ctx,state){
        if(state is TodosLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else if(state is TodosLoadedState){
          return ListView.builder(
            itemCount: state.todosList.length,
            itemBuilder: (ctx,index){
            return Container(
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              color: Colors.purple.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('User ID :- ${state.todosList[index].userId.toString()}'),
                  Text('ID :- ${state.todosList[index].id.toString()}'),
                  Text('Title :- ${state.todosList[index].title.toString()}'),
                  Checkbox(value: state.todosList[index].completed, onChanged: (val){})
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