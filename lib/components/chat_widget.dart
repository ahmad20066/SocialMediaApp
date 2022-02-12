import 'package:flutter/material.dart';

import 'package:instagram_clone/services/user_services.dart';
import 'package:intl/intl.dart';

class ChatWidget extends StatelessWidget {
  final String text;
  final bool isMe;

  final DateTime date;

  ChatWidget({required this.text, required this.isMe, required this.date});
  UserService userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            width: 140,
            margin: EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 8,
            ),
            padding: EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text,
                  textAlign: isMe ? TextAlign.start : TextAlign.start,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomRight: !isMe ? Radius.circular(10) : Radius.circular(0),
                bottomLeft: !isMe ? Radius.circular(0) : Radius.circular(10),
              ),
              color: Colors.red[300],
            ),
          ),
        ),
        Align(
          alignment: isMe ? Alignment.topRight : Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              DateFormat('hh:mm a').format(DateTime.now()),
            ),
          ),
        )
      ],
    );
  }
}
