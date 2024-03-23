// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:connectify/library.dart';

class UserModel {
  final String? id;
  final Timestamp? createdAt;
  final String? name;
  final String? email;
  final String? password;
  final String? imageUrl;
  final PhoneAuthCredential? phoneAuthCredential;
  final UserType? userType;
  UserModel({
    this.id,
    this.createdAt,
    this.name,
    this.email,
    this.password,
    this.imageUrl,
    this.phoneAuthCredential,
    this.userType,
  });

  UserModel copyWith({
    String? id,
    Timestamp? createdAt,
    String? name,
    String? email,
    String? password,
    String? imageUrl,
    PhoneAuthCredential? phoneAuthCredential,
    UserType? userType,
  }) {
    return UserModel(
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      imageUrl: imageUrl ?? this.imageUrl,
      phoneAuthCredential: phoneAuthCredential ?? this.phoneAuthCredential,
      userType: userType ?? this.userType,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'createdAt': createdAt,
      'userType': userType!.name,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String?,
      createdAt: map['createdAt'] as Timestamp?,
      userType: UserType.values
          .firstWhere((element) => element.name == map['userType'] as String?),
    );
  }
}
