import 'package:flutter/cupertino.dart';

class User {

  String id;
  String email;
  String firstName;
  String? lastName;
  String? avatar;

  User({
    required this.id,
    required this.email,
    required this.firstName,
    this.lastName,
    this.avatar
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json["id"].toString(),
        email: json['email'],
        firstName: json['first_name'],
        lastName: json['last_name'] ?? "",
        avatar: json['avatar'] ?? ""
    );
  }

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'email': email,
        'first_name': firstName,
        'last_name': lastName,
        'avatar': avatar,
      };


  @override
  String toString() {
    return 'User{id: $id, email: $email, first_name: $firstName, last_name: $lastName, avatar: $avatar}';
  }

  List<Object> get props => [id, email, firstName, lastName!, avatar!];
}