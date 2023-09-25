import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentRepo{
  List<CommentModel> commentList = [];
  final client = http.Client();
  Future<dynamic> getUserComments(userId)async{
    commentList.clear();
    var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/albums'));
    List decodeData = jsonDecode(response.body);
    commentList = decodeData.map((comment)=> CommentModel.fromJson(comment)).toList();
    debugPrint('here is comment list-->${commentList[1].body}');
    return commentList;
  }
}