import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/album_bloc/album_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/comment_bloc/comment_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/photos_bloc/photos_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/post_bloc/posts_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/todos_bloc/todos_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/user_bloc/user_bloc.dart';
import 'package:flutter_application_1/api_call/screens/user_page.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_application_1/cubit/connectivity/cubit/connectivity_with_cubit_cubit.dart';
import 'package:flutter_application_1/cubit/counter/counter_cubit.dart';
import 'package:flutter_application_1/cubit/list_functions/cubit/list_functions_cubit.dart';
import 'package:flutter_application_1/dummy_bloc/dummy_bloc.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_application_1/form_validation/form_validation_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      BlocProvider(create: (ctx)=> UserBloc()),
      BlocProvider(create: (ctx)=> CommentBloc()),
      BlocProvider(create: (ctx)=> AlbumBloc()),
      BlocProvider(create: (ctx)=> TodosBloc()),
      BlocProvider(create: (ctx)=> PhotosBloc())
    ], 
    child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
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
