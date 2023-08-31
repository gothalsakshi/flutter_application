import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../connectivity_bloc.dart';

class ConnectivityCheckScreen extends StatelessWidget {
  const ConnectivityCheckScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocProvider(
          create: (context) => ConnectivityBloc(),
          child: BlocBuilder<ConnectivityBloc, ConnectivityState>(
            builder: (context, state) {
              if(state is InternetGainedState){
                return const Text('Connected..');
              }else if(state is InternetLostState){
                return const Text('Disconnected..');
              }
              else{
                return const Text('Loading..');
              }
            },
          ),
        ),
      ),
    );
  }
}
