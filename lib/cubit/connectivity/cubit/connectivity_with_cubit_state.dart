part of 'connectivity_with_cubit_cubit.dart';

abstract class ConnectivityWithCubitState {}

class ConnectivityWithCubitInitial extends ConnectivityWithCubitState {}

class ConnectionFailedState extends ConnectivityWithCubitState{
  final ConnectivityResult connectionStatus;

  ConnectionFailedState({required this.connectionStatus});
}

class ConnectivityWithWifi extends ConnectivityWithCubitState{
  final ConnectivityResult connectionStatus;

  ConnectivityWithWifi({required this.connectionStatus});
}

class ConnectivityWithInternet extends ConnectivityWithCubitState{
  final ConnectivityResult connectionStatus;

  ConnectivityWithInternet({required this.connectionStatus});
}