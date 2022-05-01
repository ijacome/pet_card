import 'package:meta/meta.dart' show required;

class Session {
  final String token;
  final int expiresIn;
  final DateTime createdAt;

  Session({
    required this.token,
    required this.expiresIn,
    required this.createdAt
  });

  factory Session.fromJson(Map<String, dynamic> json) {
    return Session(
      token: json['access_token'],
      expiresIn: json['expires_in'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson () {
    return {
      "access_token": token,
      "expires_in": expiresIn,
      "created_at": createdAt.toIso8601String()
    };
  }
}
