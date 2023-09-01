import 'package:flutter/material.dart';
import 'package:flutter_application_1/dummy_bloc/dummy_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DummyCounterView extends StatelessWidget {
  const DummyCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<DummyBloc>(create: (ctx)=> DummyBloc(),
      child: BlocBuilder<DummyBloc,DummyState>(
        builder: (ctx,state){
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(state.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: (){
                BlocProvider.of<DummyBloc>(context).add(DummyCounterIncrementEvent());
              }, child: const Text('Add')),
              ElevatedButton(onPressed: (){
                BlocProvider.of<DummyBloc>(context).add(DummyCounterDecrementEvent());
              }, child: const Text('Delete'))
            ],
          )
        ],
      );
      })),
    );
  }
}