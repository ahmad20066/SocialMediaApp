import 'package:get/get.dart';
import 'package:instagram_clone/services/user_services.dart';

class DmController extends GetxController {
  UserService service = UserService();
  var future;
  @override
  void onInit() {
    future = service.getUsers();
    super.onInit();
  }
}
