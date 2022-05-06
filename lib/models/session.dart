import 'dart:convert';
import 'package:pet_card/models/user.dart';

class Session {
  final String token;
  final int expiresIn;
  final DateTime createdAt;
  final User user;

  Session({
    required this.token,
    required this.expiresIn,
    required this.createdAt,
    required this.user
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      token: json['access_token'],
      expiresIn: json['expires_in'],
      createdAt: DateTime.parse(json['created_at']),
      user: User.fromJson(json['user'])
    );
  }

  Map<String, dynamic> toJson () {
    return {
      "access_token": token,
      "expires_in": expiresIn,
      "created_at": createdAt.toIso8601String(),
      "user": user.toJson()
    };
  }
}
