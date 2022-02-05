import 'package:get/get.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/login_service.dart';
import 'package:instagram_clone/services/user_services.dart';

class ProfileController extends GetxController {
  LoginService loginService = LoginService();
  UserService userService = UserService();
  late UserModel currentUser;

  Future<void> LogOut() async {
    await loginService.LogOut();
    Get.offAllNamed("/RegisterScreen");
  }
}
