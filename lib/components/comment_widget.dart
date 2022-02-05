import 'package:flutter/material.dart';

class CommentWidget extends StatelessWidget {
  String name;
  String commentBody;
  String email;
  CommentWidget(
      {Key? key,
      required this.name,
      required this.commentBody,
      required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
        decoration: BoxDecoration(
            color: Colors.white24, borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "$name:",
                ),
              ),
              Align(alignment: Alignment.centerLeft, child: Text(commentBody)),
              Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "By: $email",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
