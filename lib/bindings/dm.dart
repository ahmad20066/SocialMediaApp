import 'package:get/get.dart';
import 'package:instagram_clone/modules/dm/dm_controller.dart';

class DmBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<DmController>(DmController());
  }
}
