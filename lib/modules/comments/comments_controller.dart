import 'package:get/get.dart';
import 'package:instagram_clone/models/comment.dart';
import 'package:instagram_clone/services/comments_service.dart';

class CommentsController extends GetxController {
  var postId;
  List<CommentModel> comments = [];
  var isLoading = true.obs;
  CommentService service = CommentService();

  @override
  void onInit() {
    postId = Get.arguments['postId'];
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    comments = await service.getCommentsByPost(postId);
    isLoading(false);
    super.onReady();
  }
}
