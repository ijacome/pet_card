import 'dart:convert';

Pet petFromJson(String str) => Pet.fromJson(json.decode(str));

String petToJson(Pet data) => json.encode(data.toJson());

class Pet {
  Pet({
    required this.name,
    required this.birthdate,
    required this.weight,
    required this.raze,
    required this.sex,
  });

  String name;
  String birthdate;
  String weight;
  String raze;
  String sex;

  factory Pet.fromJson(Map<String, dynamic> json) => Pet(
    name: json["name"],
    birthdate: json["birthdate"],
    weight: json["weight"],
    raze: json["raze"],
    sex: json["sex"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "birthdate": birthdate,
    "weight": weight,
    "raze": raze,
    "sex": sex,
  };
}
