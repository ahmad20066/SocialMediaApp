import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/models/comment.dart';

import 'package:http/http.dart' as http;

class CommentService {
  Future<List<CommentModel>> getCommentsByPost(String postId) async {
    final url = Uri.parse("${Constants.getCommentsUrl}$postId");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<CommentModel> comments = commentModelFromJson(response.body);
      return comments;
    }
    return [];
  }
}
