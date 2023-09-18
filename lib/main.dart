import 'package:flutter/material.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_application_1/cubit/connectivity/cubit/connectivity_with_cubit_cubit.dart';
import 'package:flutter_application_1/cubit/connectivity/view/connecnctivity_with_cubit_screen.dart';
import 'package:flutter_application_1/cubit/counter/counter_cubit.dart';
import 'package:flutter_application_1/cubit/counter/view/counter_with_cubit.dart';
import 'package:flutter_application_1/cubit/list_functions/cubit/list_functions_cubit.dart';
import 'package:flutter_application_1/cubit/list_functions/view/list_functions_screen.dart';
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
    ], 
    child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const ListFunctionsScreen(),
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
