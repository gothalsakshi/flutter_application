import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  
  Connectivity connectivity = Connectivity();
  StreamSubscription? connectivitySubscription;

  ConnectivityBloc() : super(InternetInitialState()) {
    on<InternetLostEvent>((event, emit) {
      emit(InternetLostState());
    });

    on<InternetGainedEvent>((event, emit) {
      emit(InternetGainedState());
    });

    connectivitySubscription = connectivity.onConnectivityChanged.listen((result) { 
      if(result == ConnectivityResult.wifi || result  == ConnectivityResult.mobile){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }

    });
  }

  @override
  Future<void> close() {
    connectivitySubscription?.cancel();
    return super.close();
  }
}
