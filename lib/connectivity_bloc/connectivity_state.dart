part of 'connectivity_bloc.dart';

abstract class ConnectivityState {}

final class ConnectivityInitial extends ConnectivityState {}

class WifiConnectivityState extends ConnectivityState{}

class InternetConnectivityState extends ConnectivityState{}

class NoInternetConnectivityState extends ConnectivityState{}
