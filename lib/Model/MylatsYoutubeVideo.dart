// To parse this JSON data, do
//
//     final myYoutubeVideo = myYoutubeVideoFromJson(jsonString);

import 'dart:convert';

List<MyLastsYoutubeVideo> myYoutubeVideoFromJson(String str) => List<MyLastsYoutubeVideo>.from(json.decode(str).map((x) => MyLastsYoutubeVideo.fromJson(x)));

String myYoutubeVideoToJson(List<MyLastsYoutubeVideo> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyLastsYoutubeVideo {
  MyLastsYoutubeVideo({
    this.classId,
    this.className,
    this.videosList,
  });

  int classId;
  String className;
  List<VideosList> videosList;

  MyLastsYoutubeVideo copyWith({
    int classId,
    String className,
    List<VideosList> videosList,
  }) =>
      MyLastsYoutubeVideo(
        classId: classId ?? this.classId,
        className: className ?? this.className,
        videosList: videosList ?? this.videosList,
      );

  factory MyLastsYoutubeVideo.fromJson(Map<String, dynamic> json) => MyLastsYoutubeVideo(
    classId: json["classId"] == null ? null : json["classId"],
    className: json["className"] == null ? null : json["className"],
    videosList: json["videosList"] == null ? null : List<VideosList>.from(json["videosList"].map((x) => VideosList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classId": classId == null ? null : classId,
    "className": className == null ? null : className,
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
  String classSubject;

  VideosList copyWith({
    int id,
    String title,
    String description,
    String path,
    int classSubjectId,
    String classSubject,
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
    classSubject: json["classSubject"] == null ? null : json["classSubject"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "title": title == null ? null : title,
    "description": description == null ? null : description,
    "path": path == null ? null : path,
    "classSubjectId": classSubjectId == null ? null : classSubjectId,
    "classSubject": classSubject == null ? null : classSubject,
  };
}
