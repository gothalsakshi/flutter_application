
import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/album_model.dart';
import 'package:flutter_application_1/api_call/repositories/album_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  AlbumBloc() : super(AlbumInitial()) {
  on<AlbumLoadingEvent>(albumsFetch);
  }

  Future<void> albumsFetch(
    AlbumLoadingEvent event, Emitter<AlbumState> emit) async {
    emit(AlbumLoadingState());
    List<AlbumModel> comments = await AlbumRepo().getUserAlbums(event.userId);
    debugPrint('in bloc file--->${event.userId.toString()}');
    emit(AlbumLoadedState(albumList: comments));
  }
}
