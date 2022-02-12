import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:instagram_clone/components/user_info.dart';
import 'package:instagram_clone/models/message.dart';
import 'package:instagram_clone/services/chat_service.dart';
import 'package:instagram_clone/services/user_services.dart';

class ChatController extends GetxController {
  ChatServie service = ChatServie();
  late Stream<DatabaseEvent> stream;
  late String recieverId;
  ChatController(this.recieverId);
  var content;

  @override
  void onInit() {
    stream = service
        .getRef(UserInfo.currentuserId!, recieverId)
        .orderByChild('date')
        .onValue;

    super.onInit();
  }

  void addMessage() {
    final message = MessageModel(
        content: content,
        date: DateTime.now(),
        senderId: UserInfo.currentuserId!,
        recieverId: recieverId);
    service.saveMessage(message);
  }
}
