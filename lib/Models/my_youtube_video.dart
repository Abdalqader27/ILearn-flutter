// To parse this JSON data, do
//
//     final myYoutubeVideo = myYoutubeVideoFromJson(jsonString);

import 'dart:convert';

List<MyYoutubeVideo> myYoutubeVideoFromJson(String str) => List<MyYoutubeVideo>.from(json.decode(str).map((x) => MyYoutubeVideo.fromJson(x)));

String myYoutubeVideoToJson(List<MyYoutubeVideo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyYoutubeVideo {
  MyYoutubeVideo({
    this.subjectId,
    this.subjectName,
    this.classId,
    this.videosList,
  });

  int subjectId;
  String subjectName;
  int classId;
  List<VideosList> videosList;

  MyYoutubeVideo copyWith({
    int subjectId,
    String subjectName,
    int classId,
    List<VideosList> videosList,
  }) =>
      MyYoutubeVideo(
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        classId: classId ?? this.classId,
        videosList: videosList ?? this.videosList,
      );

  factory MyYoutubeVideo.fromJson(Map<String, dynamic> json) => MyYoutubeVideo(
    subjectId: json["subjectId"] == null ? null : json["subjectId"],
    subjectName: json["subjectName"] == null ? null : json["subjectName"],
    classId: json["classId"] == null ? null : json["classId"],
    videosList: json["videosList"] == null ? null : List<VideosList>.from(json["videosList"].map((x) => VideosList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId == null ? null : subjectId,
    "subjectName": subjectName == null ? null : subjectName,
    "classId": classId == null ? null : classId,
    "videosList": videosList == null ? null : List<dynamic>.from(videosList.map((x) => x.toJson())),
  };
}

class VideosList {
  VideosList({
    this.id,
    this.title,
    this.description,
    this.path,
    this.classSubjectId,
    this.classSubject,
  });

  int id;
  String title;
  String description;
  String path;
  int classSubjectId;
  dynamic classSubject;

  VideosList copyWith({
    int id,
    String title,
    String description,
    String path,
    int classSubjectId,
    dynamic classSubject,
  }) =>
      VideosList(
        id: id ?? this.id,
        title: title ?? this.title,
        description: description ?? this.description,
        path: path ?? this.path,
        classSubjectId: classSubjectId ?? this.classSubjectId,
        classSubject: classSubject ?? this.classSubject,
      );

  factory VideosList.fromJson(Map<String, dynamic> json) => VideosList(
    id: json["id"] == null ? null : json["id"],
    title: json["title"] == null ? null : json["title"],
    description: json["description"] == null ? null : json["description"],
    path: json["path"] == null ? null : json["path"],
    classSubjectId: json["classSubjectId"] == null ? null : json["classSubjectId"],
    classSubject: json["classSubject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "path": path == null ? null : path,
    "classSubjectId": classSubjectId == null ? null : classSubjectId,
    "classSubject": classSubject,
  };
}
