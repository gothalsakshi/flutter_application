import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/list_functions/cubit/list_functions_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListFunctionsScreen extends StatelessWidget {
  const ListFunctionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: BlocBuilder<ListFunctionsCubit,ListFunctionsState>(
        builder: (ctx,state){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: (){
                context.read<ListFunctionsCubit>().addingDataIntoList();
              }),
              FloatingActionButton(
                child: const Icon(Icons.remove),
                onPressed: (){
                // context.read<ListFunctionsCubit>().removingDataIntoList();
              }),
            ],
          );
      }),
      body: BlocBuilder<ListFunctionsCubit,ListFunctionsState>(
        builder: (ctx,state){
          if(state is ListAddState){
            return ListView.builder(
            itemCount: state.list.length,  
            itemBuilder: (ctx,index){
            return ListTile(title: Text(state.list[index]),
            trailing: IconButton(onPressed: (){
              context.read<ListFunctionsCubit>().removingDataIntoList(index);
            }, icon: const Icon(Icons.delete),));
          });
          }else if(state is ListRemoveState){
            return ListView.builder(
            itemCount: state.list.length,  
            itemBuilder: (ctx,index){
            return ListTile(title: Text(state.list[index]),
            trailing: IconButton(onPressed: (){
              context.read<ListFunctionsCubit>().removingDataIntoList(index);
            }, icon: const Icon(Icons.delete),));
          });
          }else{
            return const Center(child: CircularProgressIndicator());
          }
          // if(state is ListAddState){
          //   return ListView.builder(
          //     itemCount: state.list.length,
          //     itemBuilder: (ctx,index){
          //     return ListTile(title: Text(state.list[index].toString()),);
          //   });
          // }else if(state is ListRemoveState){
          //   return ListView.builder(
          //     itemCount: state.list.length,
          //     itemBuilder: (ctx,index){
          //     return ListTile(title: Text(state.list[index].toString()),);
          //   });
          // }else{
          //   return const Center(child: CircularProgressIndicator());
          // }
      }),
    );
  }
}