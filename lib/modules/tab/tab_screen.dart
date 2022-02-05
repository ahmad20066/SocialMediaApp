// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/modules/mainScreen/main_screen.dart';
import 'package:instagram_clone/modules/profile/profile_screen.dart';
import 'package:instagram_clone/modules/splash/splash_screen.dart';
import 'package:instagram_clone/modules/tab/tab_controller.dart';

class TabScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
        builder: (controller) => Scaffold(
              body: IndexedStack(
                index: controller.tabIndex,
                children: [
                  MainScreen(),
                  ProfileScreen(),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                  currentIndex: controller.tabIndex,
                  onTap: controller.changeTabIndex,
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: "Main Screen"),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person), label: "Profile")
                  ]),
            ));
  }
}
