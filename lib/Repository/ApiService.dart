import 'dart:convert';

import 'package:ilearn/Model/MyYoutubeVideo.dart';
import 'package:ilearn/Model/MylatsYoutubeVideo.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'Api.dart';

final api = ApiServices();

class ApiServices with Api {
  @override
  Future<bool> checkInternet() {
    // TODO: implement checkInternet
    throw UnimplementedError();
  }

  @override
  Future<bool> getIsAvailableToUpdate(context) {
    // TODO: implement getIsAvailableToUpdate
    throw UnimplementedError();
  }

  @override
  Future<List<MyLastsYoutubeVideo>> getLastsYoutubeVideos(count) async {
    var url = 'http://194.32.76.82:5987/Api/GetLatestVideos/?count=$count';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);

      return List<MyLastsYoutubeVideo>.from(json.decode(response.body).map((x) => MyLastsYoutubeVideo.fromJson(x)));
    }
    return null;
  }

  @override
  Future<List<MyYoutubeVideo>> getYoutubeVideos() async {
    var url = 'http://194.32.76.82:5987/Api/Getvideos';

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    print(response.statusCode);
    if (response.statusCode == 200) {
      print(response.body);

      return List<MyYoutubeVideo>.from(json.decode(response.body).map((x) => MyYoutubeVideo.fromJson(x)));
    }
    return null;
  }
}
