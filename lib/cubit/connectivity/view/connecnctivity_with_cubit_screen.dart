import 'package:flutter/material.dart';
import 'package:flutter_application_1/cubit/connectivity/cubit/connectivity_with_cubit_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectivityWithCubitScreen extends StatelessWidget {
  const ConnectivityWithCubitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: BlocBuilder<ConnectivityWithCubit,ConnectivityWithCubitState>(
        builder: (ctx,state){
        if(state is ConnectivityWithWifi){
          return Center(child: Text(state.connectionStatus.toString()));
        }else if(state is ConnectivityWithInternet){
          return Center(child: Text(state.connectionStatus.toString()));
        }else if(state is ConnectionFailedState){
          return Center(child: Text(state.connectionStatus.toString()));
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      })
    );
  }
}