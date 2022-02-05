// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/post/post_widget.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/modules/animation_controller.dart';
import 'package:instagram_clone/modules/mainScreen/main_screen_controller.dart';
import 'package:instagram_clone/services/post_services.dart';
import 'package:instagram_clone/services/user_services.dart';

class MainScreen extends StatelessWidget {
  MainScreenController controller = Get.find();

  UserService service = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Row(
            children: [
              Image(
                image: AssetImage("images/logo-ig-png-32473.png"),
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Text(
                "Instagram",
                style: TextStyle(color: Colors.black, fontFamily: 'Yellowtail'),
              )
            ],
          ),
        ),
        body: Obx(() {
          if (controller.isLoading.isTrue) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  childAspectRatio:
                      MediaQuery.of(context).size.aspectRatio * 2.7),
              itemCount: controller.posts.length,
              itemBuilder: (context, index) {
                return FutureBuilder<UserModel>(
                    future: service.getUserById(controller.posts[index].userId),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      return PostWidget(
                        authorName: snapshot.data!.userName!,
                        body: controller.posts[index].body,
                        commentOnPressed: () {
                          Get.toNamed('/CommentsScreen', arguments: {
                            'postId': controller.posts[index].id
                          });
                        },
                      );
                    });
              });
        }));
  }
}
