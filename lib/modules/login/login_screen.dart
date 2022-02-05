// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/custom_button.dart';
import 'package:instagram_clone/components/custom_checkbox.dart';
import 'package:instagram_clone/components/custom_textfield.dart';
import 'package:instagram_clone/modules/login/login_controller.dart';

class LoginScreen extends StatelessWidget {
  LoginController controller = Get.find();
  Future<void> logIn() async {
    EasyLoading.show(status: 'Loading');
    await controller.Login();
    if (controller.logInStatus) {
      EasyLoading.showSuccess(controller.message);
      Get.offAllNamed('/TabScreen');
    } else {
      EasyLoading.showError(controller.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.pink,
            Colors.blue,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Image(
              image: AssetImage("images/logo-ig-png-32473.png"),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomTextField(
              hintText: "Enter Your email",
              onChanged: (value) {
                controller.email = value;
              },
              inputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              hintText: "Enter Your Password",
              onChanged: (value) {
                controller.password = value;
              },
              inputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              obscure: true,
            ),
            Obx(() {
              return CustomCheckBox(
                  value: controller.checkBox.value,
                  onChanged: (_) {
                    controller.changeCheckBox();
                  });
            }),
            CustomButton(text: "Login", onPressed: logIn),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Do not have an account?"),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/RegisterScreen");
                  },
                  child: Text(
                    "SignUp instead",
                    style: TextStyle(color: Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
