import 'package:flutter/material.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_application_1/dummy_bloc/dummy_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DummyCounterView extends StatelessWidget {
  const DummyCounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // using BlocBuilder
          const Text('Example of BlocBuilder'),
          BlocBuilder<DummyBloc,DummyState>(builder: (ctx,state){
            if (state is DummyCounterIncrementState){
              return Text(state.counter.toString());
            }else if(state is DummyCounterDecrementState){
              return Text(state.counter.toString());
            }else{
              return const CircularProgressIndicator();
            }
          }),
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
          ),
          // Using BlocListner
          const Text('Example of BlocListner'),
          BlocListener<DummyBloc,DummyState>(
            listener: ((ctx,state){
              if(state is DummyCounterIncrementState){
                if(state.counter > 5){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('counter is greater than 5')));
                }
              }else if(state is DummyCounterDecrementState){
                if(state.counter < 1){
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('counter is less than 1')));
                }
              }
            }),
            child: const Text('text')),

          //using BlocConsumer
          const Text('Example of BlocConsumer'),
          BlocConsumer<DummyBloc,DummyState>(
            builder: (ctx,state){
              bool updatedValue = false;
              if(state is CheckBoxUpdateState){
                updatedValue = state.checkValue;
                debugPrint('---->$updatedValue');
              } 
              return Checkbox(value: updatedValue, 
              onChanged: (val){
                debugPrint('###########---->$updatedValue');
                BlocProvider.of<DummyBloc>(context).add(CheckBoxUpdateEvent());

              });
            }, 
            listener: (ctx,state){
              if(state is CheckBoxUpdateState){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Here is value of checkbox ${state.checkValue.toString()}')));
              }
            }),

            // used multiple bloc in one file
            BlocBuilder<ConnectivityBloc,ConnectivityState>(
              builder: (ctx,state){
                if(state is WifiConnectivityState){
                  return const Text('Wifi connected...');
                }else if(state is InternetConnectivityState){
                  return const Text('Internet connected...');
                }else{
                  return const CircularProgressIndicator();
                }
              })
          
        ],
      ),
    );
  }
}