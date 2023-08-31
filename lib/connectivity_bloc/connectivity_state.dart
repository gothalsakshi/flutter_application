part of 'connectivity_bloc.dart';

abstract class ConnectivityState {}

class InternetInitialState extends ConnectivityState {}

class InternetLostState extends ConnectivityState{}

class InternetGainedState extends ConnectivityState{}
