// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/post/post_controller.dart';
import 'package:instagram_clone/modules/animation_controller.dart';
import 'package:instagram_clone/modules/mainScreen/main_screen_controller.dart';

class PostWidget extends StatelessWidget {
  String authorName;
  String body;
  var commentOnPressed;
  AnimationsController animationController = AnimationsController();
  PostController controller = PostController();

  PostWidget({
    required this.authorName,
    required this.body,
    required this.commentOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: GridTile(
          header: Text(
            authorName,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          child: Align(alignment: Alignment.centerLeft, child: Text(body)),
          footer: Container(
            color: Colors.white24,
            child: Row(
              children: [
                AnimatedBuilder(
                  builder: (context, _) {
                    return IconButton(
                        onPressed: () {
                          controller.LikeAndDislike();
                          controller.isLiked.isFalse
                              ? animationController.animationController
                                  .forward()
                              : animationController.animationController
                                  .reverse();
                        },
                        icon: Obx(() => Icon(
                              !controller.isLiked.value
                                  ? Icons.favorite_border
                                  : Icons.favorite,
                              size: animationController.sizeAnimation.value,
                            )));
                  },
                  animation: animationController.sizeAnimation,
                ),
                IconButton(
                    onPressed: commentOnPressed,
                    icon: Icon(Icons.comment_outlined))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
