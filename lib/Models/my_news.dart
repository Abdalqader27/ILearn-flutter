// To parse this JSON data, do
//
//     final myNews = myNewsFromJson(jsonString);

import 'dart:convert';

List<MyNews> myNewsFromJson(String str) => List<MyNews>.from(json.decode(str).map((x) => MyNews.fromJson(x)));

String myNewsToJson(List<MyNews> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyNews {
  MyNews({
    this.id,
    this.title,
    this.description,
    this.date,
    this.classId,
    this.className,
    this.imageUrl,
  });

  int id;
  String title;
  String description;
  DateTime date;
  int classId;
  String className;
  String imageUrl;

  MyNews copyWith({
    int id,
    String title,
    String description,
    DateTime date,
    int classId,
    String className,
    String imageUrl,
  }) =>
      MyNews(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        date: date ?? this.date,
        classId: classId ?? this.classId,
        className: className ?? this.className,
        imageUrl: imageUrl ?? this.imageUrl,
      );

  factory MyNews.fromJson(Map<String, dynamic> json) => MyNews(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    classId: json["classId"] == null ? null : json["classId"],
    className: json["className"] == null ? null : json["className"],
    imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "date": date == null ? null : date.toIso8601String(),
    "classId": classId == null ? null : classId,
    "className": className == null ? null : className,
    "imageUrl": imageUrl == null ? null : imageUrl,
  };
}
