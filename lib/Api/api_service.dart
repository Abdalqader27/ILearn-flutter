import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Resourse/CustomInterceptors.dart';
import 'package:ilearn/Models/bank_question_module.dart';
import 'package:ilearn/Models/classes.dart';
import 'package:ilearn/Models/my_document_files.dart';
import 'package:ilearn/Models/my_flash_card.dart';
import 'package:ilearn/Models/my_lasts_documents.dart';
import 'package:ilearn/Models/my_lasts_youtube_video.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/my_youtube_video.dart';
import 'package:ilearn/Models/user.dart';
import 'api_request.dart';

class ApiServices with Api {
  static Dio dio;

  static Dio getClient() {
    if (dio == null) {
      dio = new Dio();
      if (kReleaseMode) {
      } else {
        dio.interceptors.add(CustomInterceptors());
      }
      dio.options.connectTimeout = 30000; //5s
      dio.options.sendTimeout = 30000; //5s
      dio.options.receiveTimeout = 30000;
    }
    return dio;
  }

  @override
  Future<List<MyLastsYoutubeVideo>> getLastsYoutubeVideos(count) async {
    User user = User.fromJson(json.decode(await mySharedPrefs.get("user", 0)));

    var url = '${BASE_API}GetLatestVideos?classId=${user.classId}&count=$count';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return List<MyLastsYoutubeVideo>.from(json.decode(response.body).map((x) => MyLastsYoutubeVideo.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyYoutubeVideo>> getYoutubeVideos() async {
    User user = User.fromJson(json.decode(await mySharedPrefs.get("user", 0)));

    var url = '${BASE_API}Getvideos?classId=${user.classId}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print("status" + response.statusCode.toString());
    if (response.statusCode == 200) {
      return List<MyYoutubeVideo>.from(json.decode(response.body).map((x) => MyYoutubeVideo.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyNews>> getMyNews() async {
    var url = '${BASE_API}GetNews';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return List<MyNews>.from(json.decode(response.body).map((x) => MyNews.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyLastsDocuments>> getMyLastsDocuments(count) async {

    User user = User.fromJson(json.decode(await mySharedPrefs.get("user", 0)));
    var url = '${BASE_API}GetLatestDocuments?classId=${user.classId}&count=$count';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return List<MyLastsDocuments>.from(json.decode(response.body).map((x) => MyLastsDocuments.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyFlashCard>> getMyFlashCard(classId) async {
    var url = '${BASE_API}GetFlashCards?classId=$classId';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return List<MyFlashCard>.from(json.decode(response.body).map((x) => MyFlashCard.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyDocumentFiles>> getAllDocumentFiles() async {
    User user = User.fromJson(json.decode(await mySharedPrefs.get("user", 0)));

    var url = '${BASE_API}GetDocuments?classId=${user.classId}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.body);
    if (response.statusCode == 200) {
      return List<MyDocumentFiles>.from(json.decode(response.body).map((x) => MyDocumentFiles.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<QuestionBankModule>> getAllQuestionModule() async {
    User user = User.fromJson(json.decode(await mySharedPrefs.get("user", 0)));
    var url = '${BASE_API}GetExamQuestions?classId=${user.classId}&studentId=${user.studentId}';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return List<QuestionBankModule>.from(json.decode(response.body).map((x) => QuestionBankModule.fromJson(x)));
    }
    return null;
  }

  @override
  Future<bool> checkInternet() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

  @override
  Future<bool> signUp(context, {classId, deviceId, fullName, password, username, birthDate}) async {
    var url = '${BASE_API}Signup';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        body: json.encode({
          "classId": classId,
          "student": {"fullName": fullName, "password": password, "username": username, "birthDate": birthDate}
        }),
        headers: {'Content-type': 'application/json'});
    print(json.decode(response.body).toString() + response.statusCode.toString());
    if (response.body != null && response.statusCode == 200) mySharedPrefs.setValue(type: 0, stringValue: response.body, key: "user");

    return (response.statusCode == 200);
  }

  @override
  Future<bool> signIn(context, username, password) async {
    var url = '${BASE_API}SignIn';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url, headers: {'Content-type': 'application/json', 'username': '$username', 'password': '$password'});
    print(json.decode(response.body).toString() + response.statusCode.toString());
    if (response.body != null && response.statusCode == 200) mySharedPrefs.setValue(type: 0, stringValue: response.body, key: "user");
    return (response.statusCode == 200);
  }

  @override
  Future<bool> activeWithCode(context, code, classSubjectExamYear) async {
    User user = User.fromJson(json.decode(await mySharedPrefs.get("user", 0)));

    var url = '${BASE_API}ActivateStudentCode ';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url,
        body: json.encode({
          "code": {
            "code": code,
            "studentId": user.studentId,
          },
          "classSubjectExamYear": classSubjectExamYear
        }),
        headers: {'Content-type': 'application/json'});
    print(json.decode(response.body).toString() + response.statusCode.toString());

    return (response.statusCode == 200);
  }

  @override
  Future<List<Classes>> getAllClasses() async {
    var url = '${BASE_API}GetClasses';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      return List<Classes>.from(json.decode(response.body).map((x) => Classes.fromJson(x)));
    }
    return null;
  }
}
