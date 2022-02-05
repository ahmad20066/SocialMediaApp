import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/models/user_model.dart';

import 'package:http/http.dart' as http;

class RegisterService {
  var token;
  var message = 'Error Signing Up';
  Future<bool> register(String userName, String email, String password) async {
    final url = Uri.parse(Constants.registerUrl);
    var response = await http.post(url,
        headers: {
          HttpHeaders.contentTypeHeader: 'application/json',
        },
        body: jsonEncode({
          'name': userName,
          'email': email,
          'password': password,
        }));
    final jsonResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      message = jsonResponse["message"];
      token = jsonResponse["Token"];
      return true;
    } else if (response.statusCode == 422) {
      message = jsonResponse["message"];
      return false;
    } else {
      print(response.body);
      return false;
    }
  }
}
