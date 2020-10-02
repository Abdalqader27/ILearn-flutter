import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Models/my_youtube_video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeDetails extends StatefulWidget {
  final MyVideosList youtubeFiles;

  YoutubeDetails({Key key, this.youtubeFiles}) : super(key: key);

  @override
  _YoutubeDetailsState createState() => _YoutubeDetailsState();
}

class _YoutubeDetailsState extends State<YoutubeDetails> {
  YoutubePlayerController _controller;

  @override
  initState() {
    _controller = YoutubePlayerController(
      initialVideoId: '${YoutubePlayer.convertUrlToId(widget.youtubeFiles.path)}',
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: double.maxFinite,
            child: YoutubePlayer(progressIndicatorColor: Colors.blueAccent, controller: _controller),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    width: double.maxFinite,
                    child: Text(
                      "${widget.youtubeFiles.classSubject}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Text(
                      "${widget.youtubeFiles.title}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    child: Text(
                      "${widget.youtubeFiles.description}",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
