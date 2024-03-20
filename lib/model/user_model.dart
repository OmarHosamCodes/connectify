// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:connectify/library.dart';

class UserModel {
  String id;
  Timestamp createdAt;
  String name;
  String email;
  String password;
  UserType userType;
  UserModel({
    required this.id,
    required this.createdAt,
    required this.name,
    required this.email,
    required this.password,
    required this.userType,
  });

  UserModel copyWith({
    String? id,
    Timestamp? createdAt,
    String? name,
    String? email,
    String? password,
    UserType? userType,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'name': name,
      'email': email,
      'password': password,
      'userType': userType.name,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      createdAt: map['createdAt'] as Timestamp,
      name: map['name'] as String,
      email: map['email'] as String,
      password: map['password'] as String,
      userType: UserType.values
          .firstWhere((element) => element.name == map['userType'] as String),
    );
  }
}
