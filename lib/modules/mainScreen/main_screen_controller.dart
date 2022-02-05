import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/models/post.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/services/post_services.dart';
import 'package:instagram_clone/services/user_services.dart';

class MainScreenController extends GetxController {
  var a = "aa";
  List<PostModel> posts = [];
  List<UserModel> users = [];
  var isLoading = true.obs;
  PostService postService = PostService();
  UserService userService = UserService();

  @override
  void onReady() async {
    users = await userService.getUsers();
    posts = await postService.getPosts();

    isLoading(false);

    super.onReady();
  }
}
