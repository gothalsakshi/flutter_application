part of 'photos_bloc.dart';

@immutable
abstract class PhotosState {}

class PhotosInitial extends PhotosState {}

class PhotosLoadingState extends PhotosState{}

class PhotosLoadedState extends PhotosState{
  final List<PhotosModel> photosList;
  PhotosLoadedState({required this.photosList});
}
