import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/api_call/model/todos_model.dart';
import 'package:http/http.dart' as http;

class TodosRepo{
  List<TodosModel> todosList = [];
  final client = http.Client();
  Future<dynamic> getUserTodosList(userId)async{
    todosList.clear();
    var response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/$userId/todos'));
    List decodeData = jsonDecode(response.body);
    todosList = decodeData.map((comment)=> TodosModel.fromJson(comment)).toList();
    debugPrint('here is album list-->${todosList[1].title}');
    return todosList;
  }
}