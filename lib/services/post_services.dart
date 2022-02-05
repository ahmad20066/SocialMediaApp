import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:instagram_clone/constants.dart';
import 'package:instagram_clone/models/post.dart';

class PostService {
  Future<List<PostModel>> getPosts({String filterString = ''}) async {
    final url = Uri.parse("${Constants.getPostsUrl}/$filterString");
    print(url);
    var response = await http.get(url);
    print(jsonDecode(response.body));
    var jsonResponse = jsonDecode(response.body);

    if (response.statusCode == 200) {
      List<PostModel> posts = [];
      if (jsonResponse is List) {
        jsonResponse.forEach((value) {
          posts.add(PostModel.fromJson(value));
        });
      } else {
        posts.add(PostModel.fromJson(jsonResponse));
      }

      return posts;
    } else {
      return [];
    }
  }

  Future<List<PostModel>> getPostByUserId(String userId) async {
    return getPosts(filterString: userId);
  }
}
