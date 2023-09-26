import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/photos_model.dart';
import 'package:http/http.dart' as http;

class PhotosRepo{
  final client = http.Client();
  List<PhotosModel> photosList = [];
  Future<dynamic> getPhotos(int albumId)async{
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/$albumId/photos'));
    List result = jsonDecode(response.body);
    photosList = result.map((photos) => PhotosModel.fromJson(photos)).toList();
    debugPrint('it is photosList--->${photosList[1].title}');
    return photosList;
  }
}