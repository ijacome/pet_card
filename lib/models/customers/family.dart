// To parse this JSON data, do
//
//     final families = familiesFromJson(jsonString);

import 'dart:convert';

Families familiesFromJson(String str) => Families.fromJson(json.decode(str));

String familiesToJson(Families data) => json.encode(data.toJson());

class Families {
  Families({
    required this.families,
    required this.count,
  });

  List<Family> families;
  int count;

  factory Families.fromJson(Map<String, dynamic> json) => Families(
    families: List<Family>.from(json["families"].map((x) => Family.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "families": List<dynamic>.from(families.map((x) => x.toJson())),
    "count": count,
  };
}

class Family {
  Family({
    required this.id,
    required this.name,
    required this.updatedAt,
    required this.createdAt,
    required this.userIds,
  });

  String id;
  String name;
  DateTime updatedAt;
  DateTime createdAt;
  List<String> userIds;

  factory Family.fromJson(Map<String, dynamic> json) => Family(
    id: json["_id"],
    name: json["name"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    userIds: List<String>.from(json["user_ids"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "user_ids": List<dynamic>.from(userIds.map((x) => x)),
  };
}
