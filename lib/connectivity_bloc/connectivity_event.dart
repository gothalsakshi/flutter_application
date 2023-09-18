part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent {}

class WifiConnectivityEvent extends ConnectivityEvent{}

class InternetConnectivityEvent extends ConnectivityEvent{}

class NoInternetConnectivityEvent extends ConnectivityEvent{}
