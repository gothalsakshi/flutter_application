part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent {}

class InternetLostEvent extends ConnectivityEvent{}

class InternetGainedEvent extends ConnectivityEvent{}