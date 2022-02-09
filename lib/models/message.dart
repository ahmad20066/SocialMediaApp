class MessageModel {
  String userId;
  String content;
  DateTime date;
  MessageModel({
    required this.content,
    required this.date,
    required this.userId,
  });
  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
      content: json['content'] as String,
      date: DateTime.parse(json['date'] as String),
      userId: json['userId']);
  Map<String, dynamic> toJson(MessageModel message) => <String, dynamic>{
        'content': message.content,
        'date': message.date.toString(),
        'userId': message.userId,
      };
}
