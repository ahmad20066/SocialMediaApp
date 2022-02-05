import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/storage.dart';

class SplashController extends GetxController {
  late String? token;
  @override
  Future<void> onInit() async {
    token = await Storage.read("token");
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    await Future.delayed(const Duration(seconds: 2));
    if (token == null) {
      Get.offAllNamed("/RegisterScreen");
    } else {
      Get.offAllNamed('/TabScreen');
    }
    super.onReady();
  }
}
