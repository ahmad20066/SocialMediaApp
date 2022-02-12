import 'package:firebase_database/firebase_database.dart';
import 'package:instagram_clone/models/message.dart';

class ChatServie {
  final id = '';

  Future<void> saveMessage(MessageModel message) async {
    await getRef(message.senderId, message.recieverId)
        .push()
        .set(message.toJson(message));
    await getRef(message.recieverId, message.senderId)
        .push()
        .set(message.toJson(message));
  }

  DatabaseReference getRef(String senderId, String recieverId) {
    return FirebaseDatabase.instance
        .ref()
        .child('Messages')
        .child(senderId)
        .child(recieverId);
  }
}
