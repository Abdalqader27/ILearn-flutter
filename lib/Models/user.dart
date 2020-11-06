// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.studentId,
    this.student,
    this.classId,
    this.userClass,
    this.studentsList,
  });

  int id;
  int studentId;
  Student student;
  int classId;
  dynamic userClass;
  dynamic studentsList;

  User copyWith({
    int id,
    int studentId,
    Student student,
    int classId,
    dynamic userClass,
    dynamic studentsList,
  }) =>
      User(
        id: id ?? this.id,
        studentId: studentId ?? this.studentId,
        student: student ?? this.student,
        classId: classId ?? this.classId,
        userClass: userClass ?? this.userClass,
        studentsList: studentsList ?? this.studentsList,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"] == null ? null : json["id"],
    studentId: json["studentId"] == null ? null : json["studentId"],
    student: json["student"] == null ? null : Student.fromJson(json["student"]),
    classId: json["classId"] == null ? null : json["classId"],
    userClass: json["class"],
    studentsList: json["studentsList"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "studentId": studentId == null ? null : studentId,
    "student": student == null ? null : student.toJson(),
    "classId": classId == null ? null : classId,
    "class": userClass,
    "studentsList": studentsList,
  };
}

class Student {
  Student({
    this.id,
    this.fullName,
    this.username,
    this.password,
    this.deviceId,
    this.birthDate,
    this.imageId,
    this.document,
  });

  int id;
  String fullName;
  String username;
  String password;
  String deviceId;
  String birthDate;
  int imageId;
  Document document;

  Student copyWith({
    int id,
    String fullName,
    String username,
    String password,
    String deviceId,
    String birthDate,
    int imageId,
    Document document,
  }) =>
      Student(
        id: id ?? this.id,
        fullName: fullName ?? this.fullName,
        username: username ?? this.username,
        password: password ?? this.password,
        deviceId: deviceId ?? this.deviceId,
        birthDate: birthDate ?? this.birthDate,
        imageId: imageId ?? this.imageId,
        document: document ?? this.document,
      );

  factory Student.fromJson(Map<String, dynamic> json) => Student(
    id: json["id"] == null ? null : json["id"],
    fullName: json["fullName"] == null ? null : json["fullName"],
    username: json["username"] == null ? null : json["username"],
    password: json["password"] == null ? null : json["password"],
    deviceId: json["deviceId"] == null ? null : json["deviceId"],
    birthDate: json["birthDate"] == null ? null : (json["birthDate"]),
    imageId: json["imageId"] == null ? null : json["imageId"],
    document: json["document"] == null ? null : Document.fromJson(json["document"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fullName": fullName == null ? null : fullName,
    "username": username == null ? null : username,
    "password": password == null ? null : password,
    "deviceId": deviceId == null ? null : deviceId,
    "birthDate": birthDate == null ? null : birthDate,
    "imageId": imageId == null ? null : imageId,
    "document": document == null ? null : document.toJson(),
  };
}

class Document {
  Document({
    this.id,
    this.fileName,
    this.documentType,
    this.path,
    this.classSubjectId,
    this.classSubject,
    this.oldPath,
  });

  int id;
  dynamic fileName;
  dynamic documentType;
  String path;
  dynamic classSubjectId;
  dynamic classSubject;
  dynamic oldPath;

  Document copyWith({
    int id,
    dynamic fileName,
    dynamic documentType,
    String path,
    dynamic classSubjectId,
    dynamic classSubject,
    dynamic oldPath,
  }) =>
      Document(
        id: id ?? this.id,
        fileName: fileName ?? this.fileName,
        documentType: documentType ?? this.documentType,
        path: path ?? this.path,
        classSubjectId: classSubjectId ?? this.classSubjectId,
        classSubject: classSubject ?? this.classSubject,
        oldPath: oldPath ?? this.oldPath,
      );

  factory Document.fromJson(Map<String, dynamic> json) => Document(
    id: json["id"] == null ? null : json["id"],
    fileName: json["fileName"],
    documentType: json["documentType"],
    path: json["path"] == null ? null : json["path"],
    classSubjectId: json["classSubjectId"],
    classSubject: json["classSubject"],
    oldPath: json["oldPath"],
  );

  Map<String, dynamic> toJson() => {
    "id": id == null ? null : id,
    "fileName": fileName,
    "documentType": documentType,
    "path": path == null ? null : path,
    "classSubjectId": classSubjectId,
    "classSubject": classSubject,
    "oldPath": oldPath,
  };
}
