import 'dart:convert';

import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'package:listviewexample/user_model.dart';

class Service {
  static const String _baseUrl = "https://jsonplaceholder.typicode.com/";
  final String _singlePostUrl = "${_baseUrl}posts/1";
  final String _postUrl = "${_baseUrl}posts";
  var client = http.Client();

  Future<UserModel?> getSinglePost() async {
    http.Response? response;
    UserModel? userModel = UserModel();
    try {
      Uri url = Uri.parse(_singlePostUrl);
      response = await client.get(url);
      userModel = UserModel.fromJson(jsonDecode(response.body));
      debugPrint(userModel.toString());
    } catch (e) {
      debugPrint(e.toString());
    }
    return userModel;
  }

  Future<List<UserModel>?> getPost() async {
    http.Response? response;
    List<UserModel>? userList;
    // UserListModel? userModelList;
    try {
      Uri url = Uri.parse(_postUrl);
      response = await client.get(url);
      //  userModelList = UserListModel.fromJson(jsonDecode(response.body)) ;
      var data = jsonDecode(response.body);
      // debugPrint(data);
      userList = List.from(data.map((val) => UserModel.fromJson(val)));
      // debugPrint(userList.toString());

    } catch (e) {
      debugPrint(e.toString());
    }
    return userList;
  }
}
