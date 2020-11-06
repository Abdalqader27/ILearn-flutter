import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Models/my_youtube_video.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/View/navigation_pages/Playlist/youtube_details_screen.dart';

import 'package:lottie/lottie.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  @override
  _VideoScreenState createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> with TickerProviderStateMixin {
  /// for animations
  AnimationController animationController;

  /// for getData from api
  Future myFuture;

  /// my global List to get from it data

  @override
  void initState() => {
        animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this),
        myFuture = api.getYoutubeVideos(),
        super.initState(),
      };

  @override
  void dispose() => {
        animationController.dispose(),
        super.dispose(),
      };

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.transparent,
        body: FutureBuilder<List<MyYoutubeVideo>>(
            future: myFuture,
            builder: (context, snapshot) {
              if (snapshot.data == null)
                return Lottie.asset(
                  'lotti_files/29435-random-things.json',
                );
              else {
                if (snapshot.data .isEmpty)
                  return Center(
                      child: Text(
                    "لايوجد",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ));
                return ListView.builder(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemCount: snapshot.data .length,
                  itemBuilder: (context, parentIndex) => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      myTitle(snapshot.data [parentIndex].subjectName),
                      Padding(
                        padding: const EdgeInsets.only(top: 16, bottom: 16),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                width: double.maxFinite,
                                height: MediaQuery.of(context).size.height / 4.5,
                                child: AnimationLimiter(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      padding: EdgeInsets.only(left: 25, right: 6, bottom: 10),
                                      itemCount: snapshot.data [parentIndex].videosList.length,
                                      physics: BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) => myItem(
                                        snapshot: snapshot,
                                            parentIndex: parentIndex,
                                            index: index,
                                            title: snapshot.data [parentIndex].videosList[index].title,
                                            classSubject: snapshot.data [parentIndex].videosList[index].classSubject,
                                            description: snapshot.data [parentIndex].videosList[index].description,
                                            path: snapshot.data [parentIndex].videosList[index].path,
                                          )),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.grey[300],
                      ),
                    ],
                  ),
                );
              }
            }),
      );

  Widget myTitle(subjectName) => Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 13),
          child: Text(
            "$subjectName",
            textAlign: TextAlign.right,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        width: double.infinity,
      );

  Widget myItem({index, path, classSubject, title, description, parentIndex,snapshot}) => AnimationConfiguration.staggeredList(
        position: index,
        duration: const Duration(milliseconds: 1500),
        child: SlideAnimation(
          horizontalOffset: 40.0,
          child: Container(
            width: 230,
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fadeIn,
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 400),
                          child: YoutubeDetails(
                            youtubeFiles: snapshot.data[parentIndex].videosList[index],
                          )));
                },
                child: Stack(
                  children: <Widget>[
                    Positioned(top: -25, bottom: 0, right: 0, left: 0, child: myYoutubeBuilder(path)),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: myContainedItems(title: title, description: description, classSubject: classSubject),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget myYoutubeBuilder(path) => YoutubePlayer(
        progressIndicatorColor: Colors.blueAccent,
        controller: YoutubePlayerController(
          flags: YoutubePlayerFlags(enableCaption: false, autoPlay: false, hideControls: true, mute: true, disableDragSeek: true, controlsVisibleAtStart: false),
          initialVideoId: '${YoutubePlayer.convertUrlToId("$path")}',
        ),
      );

  Widget myContainedItems({@required classSubject, @required title, @required description}) => Container(
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.all(
              Radius.circular(10.0),
            ),
            gradient: LinearGradient(colors: [Colors.black, Colors.transparent, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 7),
              child: Chip(
                backgroundColor: Colors.green[100],
                label: Text("$classSubject",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    )),
                padding: EdgeInsets.all(7),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10, left: 15, right: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 230,
                    child: Text(
                      "$title",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                  Container(
                    width: 230,
                    child: Text(
                      "$description ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
