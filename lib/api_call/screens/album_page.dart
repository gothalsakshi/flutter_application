import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/album_bloc/album_bloc.dart';
import 'package:flutter_application_1/api_call/blocs/photos_bloc/photos_bloc.dart';
import 'package:flutter_application_1/api_call/screens/photos_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumPage extends StatelessWidget {
  const AlbumPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Album Page')),
      body: BlocBuilder<AlbumBloc,AlbumState>(builder: (ctx,state){
        if(state is AlbumLoadingState){
          return const Center(child: CircularProgressIndicator());
        }else if(state is AlbumLoadedState){
          return ListView.builder(
            itemCount: state.albumList.length,
            itemBuilder: (ctx,index){
            return InkWell(
              onTap: (){
                context.read<PhotosBloc>().add(PhotosLoadingEvent(albumId: state.albumList[index].id!));
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const PhotosPage()));
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                color: Colors.yellow.shade100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('User ID :- ${state.albumList[index].userId.toString()}'),
                    Text('ID :- ${state.albumList[index].id.toString()}'),
                    Text('Title :- ${state.albumList[index].title.toString()}'),
                  ],
                ),
              ),
            );
          });
        }else{
          return Container(
            height: 50,width: 50,color: Colors.grey,
          );
        }
      })
    );
  }
}