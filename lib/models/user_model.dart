class UserModel {
  String id;
  String? userName;
  String email;

  UserModel({
    required this.id,
    required this.userName,
    required this.email,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'].toString(),
        userName: json['username'] as String,
        email: json['email'] as String);
  }

  Map<String, dynamic> toJson(UserModel user) => {
        'id': user.id,
        'username': user.userName,
        'email': user.email,
      };
}
