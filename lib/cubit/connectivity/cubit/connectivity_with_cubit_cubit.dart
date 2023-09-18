import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'connectivity_with_cubit_state.dart';

class ConnectivityWithCubit extends Cubit<ConnectivityWithCubitState> {
  ConnectivityWithCubit() : super(ConnectivityWithCubitInitial()){
    checkInternetConnectivity();
  }

  ConnectivityResult connectionStatus = ConnectivityResult.none;
  final Connectivity connectivity = Connectivity();
  StreamSubscription<ConnectivityResult>? connectivitySubscription;

  checkInternetConnectivity(){
    connectivitySubscription = connectivity.onConnectivityChanged.listen((status) { 
      if(status == ConnectivityResult.mobile){
        emit(ConnectivityWithInternet(connectionStatus: status));
      }else if(status == ConnectivityResult.wifi){
        emit(ConnectivityWithWifi(connectionStatus: status));
      }else{
        emit(ConnectionFailedState(connectionStatus: status));
      }
    });
  }

  
}
