import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/chat_textfield.dart';
import 'package:instagram_clone/components/chat_widget.dart';
import 'package:instagram_clone/components/user_info.dart';
import 'package:instagram_clone/models/message.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/modules/chat/chat_controller.dart';

class ChatScreen extends StatelessWidget {
  TextEditingController msgController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final id = Get.arguments['id'];
    final username = Get.arguments['name'];

    ChatController controller = Get.put<ChatController>(ChatController(id!));
    return Scaffold(
        appBar: AppBar(
          title: Text(username),
        ),
        body: Container(
            child: StreamBuilder<DatabaseEvent>(
                stream: controller.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  List values = [];
                  snapshot.data!.snapshot.children.forEach((element) {
                    values.add(element.value);
                  });

                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: values.length,
                            itemBuilder: (context, index) {
                              final message =
                                  MessageModel.fromJson(values[index]);
                              return ChatWidget(
                                text: message.content,
                                isMe:
                                    message.senderId == UserInfo.currentuserId,
                                date: message.date,
                              );
                            }),
                      ),
                      ChatTextField(
                        msgController: msgController,
                        OnSubmitted: (val) {
                          controller.content = msgController.text;

                          controller.addMessage();
                          msgController.clear();
                        },
                        OnIconPressed: () {
                          controller.content = msgController.text;
                          FocusScope.of(context).unfocus();
                          controller.addMessage();
                          msgController.clear();
                        },
                      )
                    ],
                  );
                })));
  }
}
