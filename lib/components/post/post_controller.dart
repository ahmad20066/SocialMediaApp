import 'package:get/get.dart';

class PostController extends GetxController {
  var isLiked = false.obs;
  void LikeAndDislike() {
    isLiked(!isLiked.value);
  }
}
