

import 'package:ilearn/Model/MyYoutubeVideo.dart';
import 'package:ilearn/Model/MylatsYoutubeVideo.dart';

abstract class Api {
  /// For Check the internet isConnected or not
  Future<bool> checkInternet();


  Future<bool> getIsAvailableToUpdate(context);


  Future <List<MyLastsYoutubeVideo>>getLastsYoutubeVideos(count);
  Future <List<MyYoutubeVideo>>getYoutubeVideos();
}
