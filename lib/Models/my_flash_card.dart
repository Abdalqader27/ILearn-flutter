// To parse this JSON data, do
//
//     final myflashCard = myflashCardFromJson(jsonString);

import 'dart:convert';

List<MyFlashCard> myFlashCardFromJson(String str) => List<MyFlashCard>.from(json.decode(str).map((x) => MyFlashCard.fromJson(x)));

String myFlashCardToJson(List<MyFlashCard> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyFlashCard {
  MyFlashCard({
    this.subjectId,
    this.subjectName,
    this.classId,
    this.cardsList,
  });

  int subjectId;
  String subjectName;
  int classId;
  List<CardsList> cardsList;

  MyFlashCard copyWith({
    int subjectId,
    String subjectName,
    int classId,
    List<CardsList> cardsList,
  }) =>
      MyFlashCard(
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        classId: classId ?? this.classId,
        cardsList: cardsList ?? this.cardsList,
      );

  factory MyFlashCard.fromJson(Map<String, dynamic> json) => MyFlashCard(
    subjectId: json["subjectId"] == null ? null : json["subjectId"],
    subjectName: json["subjectName"] == null ? null : json["subjectName"],
    classId: json["classId"] == null ? null : json["classId"],
    cardsList: json["cardsList"] == null ? null : List<CardsList>.from(json["cardsList"].map((x) => CardsList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId == null ? null : subjectId,
    "subjectName": subjectName == null ? null : subjectName,
    "classId": classId == null ? null : classId,
    "cardsList": cardsList == null ? null : List<dynamic>.from(cardsList.map((x) => x.toJson())),
  };
}

class CardsList {
  CardsList({
    this.id,
    this.title,
    this.description,
    this.classSubjectId,
    this.classSubject,
  });

  int id;
  String title;
  String description;
  int classSubjectId;
  String classSubject;

  CardsList copyWith({
    int id,
    String title,
    String description,
    int classSubjectId,
    String classSubject,
  }) =>
      CardsList(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        classSubjectId: classSubjectId ?? this.classSubjectId,
        classSubject: classSubject ?? this.classSubject,
      );

  factory CardsList.fromJson(Map<String, dynamic> json) => CardsList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    classSubjectId: json["classSubjectId"] == null ? null : json["classSubjectId"],
    classSubject: json["classSubject"] == null ? null : json["classSubject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "classSubjectId": classSubjectId == null ? null : classSubjectId,
    "classSubject": classSubject == null ? null : classSubject,
  };
}
