// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  String? name;
  String? email;
  String? password;
  String? avatar;

  User({
    this.name,
    this.email,
    this.password,
    this.avatar,
  });

  User copyWith({
    String? name,
    String? email,
    String? password,
    String? avatar,
  }) =>
      User(
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        avatar: avatar ?? this.avatar,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        avatar: json["avatar"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "avatar": avatar,
      };
}
