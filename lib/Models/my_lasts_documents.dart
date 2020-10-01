// To parse this JSON data, do
//
//     final myLastsDocuments = myLastsDocumentsFromJson(jsonString);

import 'dart:convert';

List<MyLastsDocuments> myLastsDocumentsFromJson(String str) => List<MyLastsDocuments>.from(json.decode(str).map((x) => MyLastsDocuments.fromJson(x)));

String myLastsDocumentsToJson(List<MyLastsDocuments> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyLastsDocuments {
  MyLastsDocuments({
    this.classId,
    this.className,
    this.filesList,
  });

  int classId;
  String className;
  List<FilesList> filesList;

  MyLastsDocuments copyWith({
    int classId,
    String className,
    List<FilesList> filesList,
  }) =>
      MyLastsDocuments(
        classId: classId ?? this.classId,
        className: className ?? this.className,
        filesList: filesList ?? this.filesList,
      );

  factory MyLastsDocuments.fromJson(Map<String, dynamic> json) => MyLastsDocuments(
    classId: json["classId"] == null ? null : json["classId"],
    className: json["className"] == null ? null : json["className"],
    filesList: json["filesList"] == null ? null : List<FilesList>.from(json["filesList"].map((x) => FilesList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "classId": classId == null ? null : classId,
    "className": className == null ? null : className,
    "filesList": filesList == null ? null : List<dynamic>.from(filesList.map((x) => x.toJson())),
  };
}

class FilesList {
  FilesList({
    this.id,
    this.fileName,
    this.documentType,
    this.path,
    this.classSubjectId,
    this.classSubject,
    this.studentId,
    this.newsId,
    this.oldPath,
  });

  int id;
  String fileName;
  dynamic documentType;
  String path;
  dynamic classSubjectId;
  String classSubject;
  dynamic studentId;
  int newsId;
  dynamic oldPath;

  FilesList copyWith({
    int id,
    String fileName,
    dynamic documentType,
    String path,
    dynamic classSubjectId,
    String classSubject,
    dynamic studentId,
    int newsId,
    dynamic oldPath,
  }) =>
      FilesList(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        documentType: documentType ?? this.documentType,
        path: path ?? this.path,
        classSubjectId: classSubjectId ?? this.classSubjectId,
        classSubject: classSubject ?? this.classSubject,
        studentId: studentId ?? this.studentId,
        newsId: newsId ?? this.newsId,
        oldPath: oldPath ?? this.oldPath,
      );

  factory FilesList.fromJson(Map<String, dynamic> json) => FilesList(
    id: json["id"] == null ? null : json["id"],
    fileName: json["fileName"] == null ? null : json["fileName"],
    documentType: json["documentType"],
    path: json["path"] == null ? null : json["path"],
    classSubjectId: json["classSubjectId"],
    classSubject: json["classSubject"] == null ? null : json["classSubject"],
    studentId: json["studentId"],
    newsId: json["newsId"] == null ? null : json["newsId"],
    oldPath: json["oldPath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fileName": fileName == null ? null : fileName,
    "documentType": documentType,
    "path": path == null ? null : path,
    "classSubjectId": classSubjectId,
    "classSubject": classSubject == null ? null : classSubject,
    "studentId": studentId,
    "newsId": newsId == null ? null : newsId,
    "oldPath": oldPath,
  };
}
