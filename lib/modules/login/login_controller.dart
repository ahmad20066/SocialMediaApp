// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:get/get.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/login_service.dart';

class LoginController extends GetxController {
  var email;
  var password;
  var message;
  var checkBox = false.obs;
  void changeCheckBox() {
    checkBox(!checkBox.value);
  }

  bool logInStatus = false;
  LoginService service = LoginService();
  Future<void> Login() async {
    logInStatus = await service.Login(email, password, checkBox.value);
    message = service.message;
  }
}
