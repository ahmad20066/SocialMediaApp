import 'package:get/get.dart';
import 'package:instagram_clone/modules/comments/comments_controller.dart';

class CommentsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CommentsController>(CommentsController());
  }
}
