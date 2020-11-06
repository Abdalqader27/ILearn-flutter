// To parse this JSON data, do
//
//     final classes = classesFromJson(jsonString);

import 'dart:convert';

List<Classes> classesFromJson(String str) => List<Classes>.from(json.decode(str).map((x) => Classes.fromJson(x)));

String classesToJson(List<Classes> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Classes {
  Classes({
    this.id,
    this.name,
    this.studyType,
  });

  int id;
  String name;
  String studyType;

  Classes copyWith({
    int id,
    String name,
    String studyType,
  }) =>
      Classes(
        id: id ?? this.id,
        name: name ?? this.name,
        studyType: studyType ?? this.studyType,
      );

  factory Classes.fromJson(Map<String, dynamic> json) => Classes(
    id: json["id"] == null ? null : json["id"],
    name: json["name"] == null ? null : json["name"],
    studyType: json["studyType"] == null ? null : json["studyType"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "studyType": studyType == null ? null : studyType,
  };
}
