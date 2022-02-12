class MessageModel {
  String senderId;
  String recieverId;
  String content;
  DateTime date;
  MessageModel(
      {required this.content,
      required this.date,
      required this.senderId,
      required this.recieverId});
  factory MessageModel.fromJson(Map<dynamic, dynamic> json) => MessageModel(
      content: json['content'] as String,
      date: DateTime.fromMillisecondsSinceEpoch(json['date']),
      senderId: json['userId'],
      recieverId: json['recieverId']);

  Map<String, dynamic> toJson(MessageModel message) => <String, dynamic>{
        'content': message.content,
        'date': message.date.millisecondsSinceEpoch,
        'userId': message.senderId,
        'recieverId': message.recieverId,
      };
}
