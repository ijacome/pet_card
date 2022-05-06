// To parse this JSON data, do
//
//     final pets = petsFromJson(jsonString);

import 'dart:convert';

Pets petsFromJson(String str) => Pets.fromJson(json.decode(str));

String petsToJson(Pets data) => json.encode(data.toJson());

class Pets {
  Pets({
    required this.pets,
    required this.count,
  });

  List<Pet> pets;
  int count;

  factory Pets.fromJson(Map<String, dynamic> json) => Pets(
    pets: List<Pet>.from(json["pets"].map((x) => Pet.fromJson(x))),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "pets": List<dynamic>.from(pets.map((x) => x.toJson())),
    "count": count,
  };
}

class Pet {
  Pet({
    required this.id,
    required this.name,
    required this.birthDate,
    required this.observation,
    required this.familyId,
    required this.updatedAt,
    required this.createdAt,
  });

  String id;
  String name;
  DateTime birthDate;
  String observation;
  String familyId;
  DateTime updatedAt;
  DateTime createdAt;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    id: json["_id"],
    name: json["name"],
    birthDate: DateTime.parse(json["birthDate"]),
    observation: json["observation"],
    familyId: json["family_id"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "birthDate": birthDate.toIso8601String(),
    "observation": observation,
    "family_id": familyId,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
  };
}
