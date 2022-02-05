// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/comment_widget.dart';
import 'package:instagram_clone/modules/comments/comments_controller.dart';

class CommentsScreen extends StatelessWidget {
  CommentsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Comments"),
        ),
        body: Container(
          color: Colors.orange[100],
          child: Obx(() {
            if (controller.isLoading.isTrue) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
                shrinkWrap: true,
                itemCount: controller.comments.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      CommentWidget(
                        name: controller.comments[index].name,
                        commentBody: controller.comments[index].body,
                        email: controller.comments[index].email,
                      ),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  );
                });
          }),
        ));
  }
}
