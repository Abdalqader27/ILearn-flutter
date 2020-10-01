import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetails extends StatefulWidget {
  @override
  _YoutubeDetailsState createState() => _YoutubeDetailsState();
}

class _YoutubeDetailsState extends State<YoutubeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            child: YoutubePlayer(
              progressIndicatorColor: Colors.blueAccent,
              controller: YoutubePlayerController(

                initialVideoId: '${YoutubePlayer.convertUrlToId("https://www.youtube.com/watch?v=Qwdyx9kAPlU")}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
