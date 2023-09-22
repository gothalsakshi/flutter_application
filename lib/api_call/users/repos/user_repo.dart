import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/api_call/users/model/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserRepo{
  List<UserModel> userList = [];
  final client = http.Client();
  Future<dynamic> getUserList()async{
    final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users/'));
    List decodeData = jsonDecode(response.body.toString());
    // final userData = userModelFromJson(decodeData.toString());
    for (var i = 0; i < decodeData.length; i++) {
      UserModel userModel = UserModel.fromJson(decodeData[i] as Map<String,dynamic>);
      userList.add(userModel);
    }
    
    
    debugPrint('here is user list--->${userList[0].name}');
    return userList;
  }
}