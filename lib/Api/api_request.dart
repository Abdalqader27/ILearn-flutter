import 'package:dio/dio.dart';
import 'package:ilearn/Models/classes.dart';
import 'package:ilearn/Models/my_document_files.dart';
import 'package:ilearn/Models/my_flash_card.dart';
import 'package:ilearn/Models/my_lasts_documents.dart';
import 'package:ilearn/Models/my_lasts_youtube_video.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/bank_question_module.dart';
import 'package:ilearn/Models/my_youtube_video.dart';
import 'package:ilearn/Models/user.dart';

mixin Api {
  Future<List<MyLastsYoutubeVideo>> getLastsYoutubeVideos(count);

  Future<List<MyYoutubeVideo>> getYoutubeVideos();

  Future<List<MyNews>> getMyNews();

  Future<List<MyLastsDocuments>> getMyLastsDocuments(count);

  Future<List<MyFlashCard>> getMyFlashCard(classId);

  Future<List<MyDocumentFiles>> getAllDocumentFiles();

  Future<List<QuestionBankModule>> getAllQuestionModule();

  Future<bool> signUp(context, {classId, deviceId, fullName, password, username, birthDate});

  Future<bool> signIn(context, username, password);

  Future<bool> activeWithCode(context, code, classSubjectExamYear);

  Future<bool> checkInternet();

  Future<List<Classes>> getAllClasses();
}
