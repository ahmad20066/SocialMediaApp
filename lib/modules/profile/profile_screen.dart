// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/login/login_controller.dart';
import 'package:instagram_clone/modules/profile/profile_controller.dart';
import 'package:instagram_clone/services/login_service.dart';
import 'package:instagram_clone/services/user_services.dart';

class ProfileScreen extends StatelessWidget {
  ProfileController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Align(
            alignment: Alignment.center,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage('images/kindpng_2697881.png'),
              radius: 70,
            )),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.05,
        ),
        Text("Name: Ahmad Afif"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Text("email: ahmad@gmail.com"),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        IconButton(
          iconSize: 40,
          onPressed: () async {
            await controller.LogOut();
          },
          icon: Icon(Icons.logout),
          color: Colors.red,
        )
      ],
    ));
  }
}
