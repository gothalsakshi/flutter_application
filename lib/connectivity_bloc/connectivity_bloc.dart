import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;
  
  ConnectivityBloc() : super(ConnectivityInitial()) {
    on<ConnectivityEvent>((event, emit) {
     
      if(event is InternetConnectivityEvent){
        emit(InternetConnectivityState());
      }else if(event is WifiConnectivityEvent){
        emit(WifiConnectivityState());
      }else if(event is NoInternetConnectivityEvent){
        emit(NoInternetConnectivityState());
      }
          });

      connectivitySubscription = connectivity.onConnectivityChanged.listen((result) { 
      if(result == ConnectivityResult.none){
        add(NoInternetConnectivityEvent());
      }else if(result == ConnectivityResult.mobile){
        add(InternetConnectivityEvent());
      }else if(result == ConnectivityResult.wifi){
        add(WifiConnectivityEvent());
      }
    });

  }

  Future<void> updateConnectionStatus(ConnectivityResult result) async {
      connectionStatus = result;
  }

  void initConnectivity(){
    connectivitySubscription = connectivity.onConnectivityChanged.listen((result) { 
      if(result == ConnectivityResult.none){

      }else if(result == ConnectivityResult.mobile){

      }else if(result == ConnectivityResult.wifi){

      }else{

      }
    });
  }
}
