import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/photos_model.dart';
import 'package:flutter_application_1/api_call/repositories/photos_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'photos_event.dart';
part 'photos_state.dart';

class PhotosBloc extends Bloc<PhotosEvent, PhotosState> {
  PhotosBloc() : super(PhotosInitial()) {
    on<PhotosLoadingEvent>(getPhotosData);
  }
  Future<void> getPhotosData(PhotosLoadingEvent event,Emitter<PhotosState> emit)async{
    emit(PhotosLoadingState());
    List<PhotosModel> photosList = await PhotosRepo().getPhotos(event.albumId);
    emit(PhotosLoadedState(photosList: photosList));
  }
}
