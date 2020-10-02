// To parse this JSON data, do
//
//     final myDocumentFiles = myDocumentFilesFromJson(jsonString);

import 'dart:convert';

List<MyDocumentFiles> myDocumentFilesFromJson(String str) => List<MyDocumentFiles>.from(json.decode(str).map((x) => MyDocumentFiles.fromJson(x)));

String myDocumentFilesToJson(List<MyDocumentFiles> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MyDocumentFiles {
  MyDocumentFiles({
    this.subjectId,
    this.subjectName,
    this.classId,
    this.filesList,
  });

  int subjectId;
  String subjectName;
  int classId;
  List<FilesList> filesList;

  MyDocumentFiles copyWith({
    int subjectId,
    String subjectName,
    int classId,
    List<FilesList> filesList,
  }) =>
      MyDocumentFiles(
        subjectId: subjectId ?? this.subjectId,
        subjectName: subjectName ?? this.subjectName,
        classId: classId ?? this.classId,
        filesList: filesList ?? this.filesList,
      );

  factory MyDocumentFiles.fromJson(Map<String, dynamic> json) => MyDocumentFiles(
    subjectId: json["subjectId"] == null ? null : json["subjectId"],
    subjectName: json["subjectName"] == null ? null : json["subjectName"],
    classId: json["classId"] == null ? null : json["classId"],
    filesList: json["filesList"] == null ? null : List<FilesList>.from(json["filesList"].map((x) => FilesList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectId": subjectId == null ? null : subjectId,
    "subjectName": subjectName == null ? null : subjectName,
    "classId": classId == null ? null : classId,
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
