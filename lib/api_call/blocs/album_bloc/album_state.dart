part of 'album_bloc.dart';

@immutable
abstract class AlbumState {}

class AlbumInitial extends AlbumState {}

class AlbumLoadingState extends AlbumState{}

class AlbumLoadedState extends AlbumState{
  final List<AlbumModel> commentList;

  AlbumLoadedState({required this.commentList});
}

class AlbumError extends AlbumState{
  final String errorMessage;

  AlbumError({required this.errorMessage});
}
