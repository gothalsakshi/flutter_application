import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumRepo{
  List<AlbumModel> albumList = [];
  final client = http.Client();
  Future<dynamic> getUserAlbums(userId)async{
    albumList.clear();
    var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/albums'));
    List decodeData = jsonDecode(response.body);
    albumList = decodeData.map((comment)=> AlbumModel.fromJson(comment)).toList();
    debugPrint('here is album list-->${albumList[1].title}');
    return albumList;
  }
}