import 'package:ilearn/Models/my_flash_card.dart';
import 'package:ilearn/Models/my_lasts_documents.dart';
import 'package:ilearn/Models/my_lasts_youtube_video.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/my_youtube_video.dart';

mixin Api {
  Future<List<MyLastsYoutubeVideo>> getLastsYoutubeVideos(count);

  Future<List<MyYoutubeVideo>> getYoutubeVideos();

  Future<List<MyNews>> getMyNews();

  Future<List<MyLastsDocuments>> getMyLastsDocuments(count);

  Future<List<MyFlashCard>> getMyFlashCard();
}
