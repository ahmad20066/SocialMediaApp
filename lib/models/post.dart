import 'dart:convert';

import 'package:instagram_clone/models/user_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'post.g.dart';

List<PostModel> postModelFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postModelToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

@JsonSerializable()
class PostModel {
  String userId;
  String id;
  String title;
  String body;
  PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });
  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);
}
