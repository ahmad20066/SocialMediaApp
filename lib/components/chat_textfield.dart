import 'package:flutter/material.dart';

class ChatTextField extends StatelessWidget {
  TextEditingController msgController;
  var OnSubmitted;
  var OnIconPressed;
  ChatTextField(
      {required this.msgController,
      required this.OnSubmitted,
      required this.OnIconPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                  controller: msgController,
                  decoration: InputDecoration(
                    hintText: 'Send a message',
                  ),
                  onFieldSubmitted: OnSubmitted),
            ),
            IconButton(onPressed: OnIconPressed, icon: Icon(Icons.send))
          ],
        ),
      ),
    );
  }
}
