import 'dart:convert';

import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_clone/components/user_info.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/storage.dart';

class LoginService {
  var token;
  var message = "error";
  Future<bool> Login(String email, String password, bool checkBox) async {
    var url = Uri.parse(Constants.loginUrl);
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({'email': email, 'password': password}));
    final jsonResponse = jsonDecode(response.body);
    print(response.body);
    if (response.statusCode == 200) {
      token = jsonResponse['data']['Token'];
      message = jsonResponse['message'];
      UserInfo.currentuserId = jsonResponse['data']['Id'].toString();
      print(UserInfo.currentuserId);

      UserInfo.userToken = token;
      print(token);
      if (checkBox) {
        Storage.save(UserInfo.userToken!);
      }
      return true;
    } else if (response.statusCode == 401) {
      message = jsonResponse['Message'];
      return false;
    } else {
      print(response.body);
      return false;
    }
  }

  Future<void> LogOut() async {
    await Storage.delete();
    UserInfo.userToken = null;
  }
}
