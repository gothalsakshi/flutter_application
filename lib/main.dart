import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/post_bloc/posts_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api_call/screens/user_page.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_application_1/cubit/connectivity/cubit/connectivity_with_cubit_cubit.dart';
import 'package:flutter_application_1/cubit/counter/counter_cubit.dart';
import 'package:flutter_application_1/cubit/list_functions/cubit/list_functions_cubit.dart';
import 'package:flutter_application_1/dummy_bloc/dummy_bloc.dart';
import 'package:flutter_application_1/form_validation/form_validation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (ctx)=> DummyBloc()),
      BlocProvider(create: (ctx)=> ConnectivityBloc()),
      BlocProvider(create: (ctx)=> FormValidationBloc()),
      BlocProvider(create: (ctx)=> CounterCubit()),
      BlocProvider(create: (ctx)=> ConnectivityWithCubit()),
      BlocProvider(create: (ctx)=> ListFunctionsCubit()),
      BlocProvider(create: (ctx)=> PostsBloc()),
      BlocProvider(create: (ctx)=> UserBloc())
    ], 
    child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const UserPage(),
      ));
    
    // BlocProvider(
    //   create: (context) => DummyBloc(),
    //   child: MaterialApp(
    //     title: 'Flutter Demo',
    //     theme: ThemeData(
    //       colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
    //       useMaterial3: true,
    //     ),
    //     home: const DummyCounterView(),
    //   ),
    // );
  }
}
