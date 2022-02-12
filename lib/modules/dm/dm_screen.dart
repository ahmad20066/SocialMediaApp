import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/user_widget.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/modules/dm/dm_controller.dart';

class DmScreen extends StatelessWidget {
  DmController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<UserModel>>(
          future: controller.future,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final users = snapshot.data;
            return Container(
              color: Colors.red[300],
              child: ListView.builder(
                  itemCount: users!.length,
                  itemBuilder: (context, index) {
                    return UserWidget(
                      username: users[index].userName!,
                      recieverId: users[index].id,
                    );
                  }),
            );
          }),
    );
  }
}
