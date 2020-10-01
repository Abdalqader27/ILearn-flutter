import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Models/my_lasts_youtube_video.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/my_youtube_video.dart';
import 'api_request.dart';

class ApiServices with Api {

  @override
  Future<List<MyLastsYoutubeVideo>> getLastsYoutubeVideos(count) async {
    var url = '${BASE_API}GetLatestVideos/?count=$count';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      return List<MyLastsYoutubeVideo>.from(json.decode(response.body).map((x) => MyLastsYoutubeVideo.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyYoutubeVideo>> getYoutubeVideos() async {
    var url = '${BASE_API}Getvideos';
    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.statusCode);
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
    print(response.statusCode);
    if (response.statusCode == 200) {
      return List<MyNews>.from(json.decode(response.body).map((x) => MyNews.fromJson(x)));
    }
    return null;
  }
}
