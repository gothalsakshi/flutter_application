import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/blocs/photos_bloc/photos_bloc.dart';
import 'package:flutter_application_1/connectivity_bloc/connectivity_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotosPage extends StatelessWidget {
  const PhotosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectivityBloc, ConnectivityState>(
      builder: (context, state) {
        if (state is InternetConnectivityState ||
            state is WifiConnectivityState) {
          return Scaffold(
              appBar: AppBar(
                title: const Text('Photos Page'),
              ),
              body: BlocBuilder<PhotosBloc, PhotosState>(builder: (ctx, state) {
                if (state is PhotosLoadingState) {
                  return const Center(child: LinearProgressIndicator());
                } else if (state is PhotosLoadedState) {
                  return ListView.builder(
                      itemCount: state.photosList.length,
                      itemBuilder: (ctx, index) {
                        return Container(
                          color: Colors.greenAccent.shade100,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  'Album ID :- ${state.photosList[index].albumId.toString()}'),
                              Text(
                                  'Photo ID :- ${state.photosList[index].id.toString()}'),
                              Text(
                                  'Albumb Title :- ${state.photosList[index].title!}'),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    children: [
                                      const Text('Photos Url'),
                                      Image.network(loadingBuilder: (context,
                                              child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      }, state.photosList[index].url!,
                                          height: 50, width: 50),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      const Text('Thumbnail Url'),
                                      Image.network(loadingBuilder: (context,
                                              child, loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        } else {
                                          return const CircularProgressIndicator();
                                        }
                                      }, state.photosList[index].thumbnailUrl!,
                                          height: 50, width: 50),
                                    ],
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      });
                } else {
                  return Container();
                }
              }));
        } else if (state is NoInternetConnectivityState) {
          return const Scaffold(
              body: Center(
                  child: Text(
            'Please check your internet connection',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          )));
        } else {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
