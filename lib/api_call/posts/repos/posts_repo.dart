import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/posts/model/posts_response_model.dart';
import 'package:http/http.dart' as http;

class PostsRepo{
  final  client = http.Client();
 
  Future<dynamic> getPostList() async {
    List<PostDataUiModel> postsList = [];
      try {
        var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
        List result = jsonDecode(response.body);
        for (var i = 0; i < result.length ; i++) {
          PostDataUiModel post = PostDataUiModel.fromMap(result[i] as Map<String,dynamic>);
          postsList.add(post);
        }
        
        return postsList;
      } catch (e) {
        debugPrint(e.toString());
        return e.toString();
      }
  }
}