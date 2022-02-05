import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/bindings/comments.dart';
import 'package:instagram_clone/bindings/login.dart';

import 'package:instagram_clone/bindings/register.dart';
import 'package:instagram_clone/bindings/splash.dart';
import 'package:instagram_clone/bindings/tab.dart';
import 'package:instagram_clone/modules/comments/comments_screen.dart';
import 'package:instagram_clone/modules/login/login_screen.dart';
import 'package:instagram_clone/modules/mainScreen/main_screen.dart';
import 'package:instagram_clone/modules/profile/profile_screen.dart';
import 'package:instagram_clone/modules/register/register_screen.dart';
import 'package:instagram_clone/modules/splash/splash_screen.dart';
import 'package:instagram_clone/modules/tab/tab_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      smartManagement: SmartManagement.keepFactory,
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.red,
      ),
      builder: (context, child) {
        child = SafeArea(child: child!);
        child = EasyLoading.init()(context, child);
        return child;
      },
      initialRoute: '/SplashScreen',
      getPages: [
        GetPage(
          name: '/mainScreen',
          page: () => MainScreen(),
        ),
        GetPage(
            name: '/loginScreen',
            page: () => LoginScreen(),
            binding: LoginBinding()),
        GetPage(
            name: '/RegisterScreen',
            page: () => RegisterScreen(),
            binding: RegisterBinding()),
        GetPage(
            name: '/SplashScreen',
            page: () => SplashScreen(),
            binding: SplashBinding()),
        GetPage(
            name: '/CommentsScreen',
            page: () => CommentsScreen(),
            binding: CommentsBinding()),
        GetPage(
            name: '/TabScreen', page: () => TabScreen(), binding: TabBinding()),
        GetPage(name: '/ProfileScreen', page: () => ProfileScreen())
      ],
    );
  }
}
