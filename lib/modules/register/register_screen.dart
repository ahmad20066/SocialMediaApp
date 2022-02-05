// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/custom_button.dart';
import 'package:instagram_clone/components/custom_textfield.dart';
import 'package:instagram_clone/modules/login/login_controller.dart';
import 'package:instagram_clone/modules/register/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  RegisterController controller = Get.find();
  Future<void> register() async {
    if (controller.password == controller.passwordConfirmation) {
      EasyLoading.show(status: 'Loading..');
      await controller.register();
      if (controller.signUpStatus) {
        Get.offAllNamed('/TabScreen');
        EasyLoading.showSuccess("Signed Up successfully");
      } else {
        EasyLoading.showError(controller.message);
      }
    } else {
      EasyLoading.showError("passwords do not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
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
            Image(
              image: AssetImage("images/logo-ig-png-32473.png"),
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            CustomTextField(
              hintText: "Enter a User name",
              onChanged: (value) {
                controller.userName = value;
              },
              inputAction: TextInputAction.next,
              keyboardType: TextInputType.name,
            ),
            CustomTextField(
              hintText: "Enter an email",
              onChanged: (value) {
                controller.email = value;
              },
              inputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
            ),
            CustomTextField(
              hintText: "Enter a password",
              onChanged: (value) {
                controller.password = value;
              },
              inputAction: TextInputAction.next,
              keyboardType: TextInputType.visiblePassword,
              obscure: true,
            ),
            CustomTextField(
              hintText: "Confirm your password",
              onChanged: (value) {
                controller.passwordConfirmation = value;
              },
              inputAction: TextInputAction.done,
              keyboardType: TextInputType.visiblePassword,
              obscure: true,
            ),
            CustomButton(text: 'SignUp', onPressed: register),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                InkWell(
                  onTap: () {
                    Get.offAllNamed("/loginScreen");
                  },
                  child: Text(
                    "Login instead",
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
