import 'package:get/get.dart';

import 'package:instagram_clone/components/post/post_controller.dart';
import 'package:instagram_clone/modules/animation_controller.dart';

import 'package:instagram_clone/modules/mainScreen/main_screen_controller.dart';
import 'package:instagram_clone/modules/profile/profile_controller.dart';
import 'package:instagram_clone/modules/tab/tab_controller.dart';

class TabBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<TabsController>(TabsController());
    Get.put<MainScreenController>(MainScreenController());
    Get.put<ProfileController>(ProfileController());
    Get.put<AnimationsController>(AnimationsController());
    Get.put<PostController>(PostController());
  }
}
