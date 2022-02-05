import 'dart:convert';

import 'package:instagram_clone/components/user_info.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/models/user_model.dart';

import 'package:http/http.dart' as http;

class UserService {
  Future<List<UserModel>> getUsers() async {
    final url = Uri.parse(Constants.getUsersUrl);
    final response = await http.get(url);
    final jsonResponse = jsonDecode(response.body) as List<dynamic>;
    final List<UserModel> users = [];
    jsonResponse.forEach((element) {
      users.add(UserModel.fromJson(element));
    });
    return users;
  }

  Future<UserModel> getUserById(String id) async {
    final users = await getUsers();
    UserModel user = users.firstWhere((element) => element.id == id);
    return user;
  }

  Future<UserModel> getCurrentUser() async {
    final currentUser = await getUserById(UserInfo.currentuserId!);
    return currentUser;
  }
}
