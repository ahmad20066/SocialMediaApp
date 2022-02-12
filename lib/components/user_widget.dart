import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserWidget extends StatelessWidget {
  String username;
  String recieverId;
  UserWidget({required this.username, required this.recieverId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed('/ChatScreen',
            arguments: {'id': recieverId, 'name': username});
      },
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Material(
            elevation: 10,
            child: ListTile(
              title: Text('Chat with $username'),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
