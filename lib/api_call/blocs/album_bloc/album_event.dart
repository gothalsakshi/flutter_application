part of 'album_bloc.dart';

@immutable
abstract class AlbumEvent {}

class AlbumLoadingEvent extends AlbumEvent{
  final int userId;

  AlbumLoadingEvent({required this.userId});
}

class AlbumLoadedEvent extends AlbumEvent{}