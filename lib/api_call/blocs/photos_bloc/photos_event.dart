part of 'photos_bloc.dart';

@immutable
abstract class PhotosEvent {}

class PhotosLoadingEvent extends PhotosEvent{
  final int albumId;
  PhotosLoadingEvent({required this.albumId});
}

class PhotosLoadedEvent extends PhotosEvent{}