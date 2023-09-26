part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoadingState extends AlbumState{}

class AlbumLoadedState extends AlbumState{
  final List<AlbumModel> albumList;

  AlbumLoadedState({required this.albumList});
}

class AlbumError extends AlbumState{
  final String errorMessage;

  AlbumError({required this.errorMessage});
}
