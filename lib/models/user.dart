class User {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List families;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
    required this.families,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    User user = User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      families: json['family_ids'],
    );
    return user;
  }

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "name": name,
      "email": name,
      "created_at": createdAt.toIso8601String(),
      "updated_at": updatedAt.toIso8601String(),
      "family_ids": families,
    };
  }
}
