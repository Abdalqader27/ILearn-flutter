import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_dimen.dart';
import 'package:ilearn/Helper/Constants/constants_fonts.dart';
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/components/custom_tab_indicator.dart';
import 'package:ilearn/Helper/Widgets/custom_items/loading.dart';
import 'package:ilearn/Models/my_lasts_documents.dart';
import 'package:ilearn/Models/my_lasts_youtube_video.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/my_youtube_video.dart';
import 'package:ilearn/View/navigation_pages/BotFiles/pdf_reader_screen.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/View/navigation_pages/Playlist/youtube_details_screen.dart';

import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

import 'Search/search_screen.dart';
import 'news/news_screen.dart';
import 'news/news_screen_details.dart';
import 'package:intl/intl.dart' as intl;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int indexTabBar = 0;
  Future myVideosFuture;
  Future myNewsFuture;
  Future myLastsDocumentFuture;

  @override
  void initState() {
    myLastsDocumentFuture = api.getMyLastsDocuments(kItems);
    myVideosFuture = api.getLastsYoutubeVideos(kItems);
    myNewsFuture = api.getMyNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Stack(
          children: [
            Positioned(left: 0, child: Lottie.asset("lotti_files/22193-partly-cloudy.json", height: 70)),
            ListView(
              physics: BouncingScrollPhysics(),
              children: [
                Padding(
                    padding: EdgeInsets.only(left: 25, top: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'مرحبا بك ',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                      ],
                    )),
                Container(
                  height: 49,
                  margin: EdgeInsets.only(left: 25, right: 25, top: 18),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: kLightGreyColor),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        child: TextField(
                          readOnly: true,
                          onTap: () {
                            Navigator.push(context, PageTransition(type: PageTransitionType.fadeIn, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: SearchScreen()));
                          },
                          maxLengthEnforced: true,
                          style: TextStyle(fontSize: 16, color: kBlackColor, fontWeight: FontWeight.w600),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 0, right: 50, bottom: 0),
                              border: InputBorder.none,
                              hintText: 'البحث  عن ...',
                              hintStyle: TextStyle(fontSize: 16, color: kGreyColor, fontWeight: FontWeight.w600)),
                        ),
                        alignment: Alignment.center,
                      ),
                      Positioned(
                        top: 0,
                        right: 9,
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/icons/icon_search_white.svg',
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(
                    color: Colors.grey[200],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 0, right: 25),
                  child: Text(
                    'موخرا ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 25),
                  child: StreamBuilder<int>(
                      stream: choiceFilesOrVideo.observableObject,
                      builder: (context, snapshot) {
                        if (snapshot.data == null) return Container();
                        return DefaultTabController(
                          initialIndex: snapshot.data,
                          length: 2,
                          child: TabBar(
                              labelPadding: EdgeInsets.all(0),
                              indicatorPadding: EdgeInsets.all(0),
                              isScrollable: true,
                              onTap: (index) {
                                index == 0 ? choiceFilesOrVideo.changeObject(0) : choiceFilesOrVideo.changeObject(1);
                              },
                              labelColor: kBlackColor,
                              unselectedLabelColor: kGreyColor,
                              labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: sstArabic),
                              unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: sstArabic),
                              indicator: RoundedRectangleTabIndicator(weight: 3, width: 10, color: kBlackColor),
                              tabs: [
                                Tab(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 23),
                                    child: Text(' الملفات  '),
                                  ),
                                ),
                                Tab(
                                  child: Container(
                                    margin: EdgeInsets.only(right: 23),
                                    child: Text('الفيدوهات '),
                                  ),
                                ),
                              ]),
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  height: MediaQuery.of(context).size.height / 4.5,
                  child: StreamBuilder<int>(
                      stream: choiceFilesOrVideo.observableObject,
                      builder: (context, snapshot) {
                        if (snapshot.data == 0)
                          return Container(
                            child: FutureBuilder<List<MyLastsDocuments>>(
                                future: myLastsDocumentFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.data == null)
                                    return Loading();
                                  else {
                                    MyLastsDocuments myObject = snapshot.data.firstWhere((element) => element.classId == 3);
                                    return Padding(
                                      padding: const EdgeInsets.only(top: 5.0),
                                      child: Center(
                                        child: AnimationLimiter(
                                          child: ListView.builder(
                                              padding: EdgeInsets.only(left: 5, right: 6, bottom: 0),
                                              itemCount: myObject.filesList.length,
                                              physics: BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context, index) {
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => PdfReaderPage(myObject.filesList[index])));
                                                  },
                                                  child: AnimationConfiguration.staggeredList(
                                                    position: index,
                                                    duration: const Duration(milliseconds: 1500),
                                                    child: SlideAnimation(
                                                      horizontalOffset: 20,
                                                      child: Card(
                                                        color: Colors.transparent,
                                                        elevation: 0,
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                                        child: Container(
                                                          margin: EdgeInsets.only(right: 0, top: 5),
                                                          width: 105,
                                                          child: Column(
                                                            children: <Widget>[
                                                              Padding(
                                                                padding: const EdgeInsets.only(left: 4.0, right: 4.0),
                                                                child: Text(
                                                                  '${myObject.filesList[index].fileName}',
                                                                  softWrap: true,
                                                                  overflow: TextOverflow.ellipsis,
                                                                  maxLines: 1,
                                                                  style: TextStyle(color: Colors.grey),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Stack(
                                                                  children: <Widget>[
                                                                    Positioned(
                                                                      left: 0,
                                                                      right: 0,
                                                                      child: Container(
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
                                                                          child: Container(
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: const BorderRadius.all(Radius.circular(16.0)), color: Colors.grey[400].withOpacity(.1)),
                                                                            child: ClipRRect(
                                                                              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                                                              child: AspectRatio(
                                                                                  aspectRatio: 0.8,
                                                                                  child: Column(
                                                                                    children: <Widget>[
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: const EdgeInsets.all(0.0),
                                                                                          child: SvgPicture.asset(
                                                                                            "SvgFiles/pdf3.svg",
                                                                                            width: 60,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  )),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              }),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                          );
                        else
                          return Container(
                            child: FutureBuilder<List<MyLastsYoutubeVideo>>(
                                future: myVideosFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.data == null)
                                    return Loading();
                                  else {
                                    MyLastsYoutubeVideo myObject = snapshot.data.firstWhere((element) => element.classId == 3);
                                    return Directionality(
                                      textDirection: TextDirection.rtl,
                                      child: AnimationLimiter(
                                        child: ListView.builder(
                                            padding: EdgeInsets.only(left: 25, right: 6, bottom: 10),
                                            itemCount: myObject.videosList.length,
                                            physics: BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (context, index) {
                                              if (index == myObject.videosList.length - 1)
                                                return AnimationConfiguration.staggeredList(
                                                  position: index,
                                                  duration: const Duration(milliseconds: 1500),
                                                  child: SlideAnimation(
                                                    verticalOffset: 40.0,
                                                    child: Row(
                                                      children: [
                                                        myFirstItem(index, myObject),
                                                        Padding(
                                                          padding: const EdgeInsets.all(18.0),
                                                          child: Center(
                                                            child: Column(
                                                              mainAxisSize: MainAxisSize.min,
                                                              children: [
                                                                Container(
                                                                  child: FloatingActionButton(
                                                                    elevation: 0,
                                                                    backgroundColor: Colors.white,
                                                                    mini: true,
                                                                    onPressed: () {
                                                                      Toast.show("تم الانتقال الى صفحة الفيديوهات ", context, duration: Toast.LENGTH_LONG, backgroundColor: Colors.deepPurpleAccent);
                                                                      myAppBottomNavigation.changeObject(2);
                                                                    },
                                                                    child: Center(
                                                                        child: Icon(
                                                                      Icons.arrow_forward,
                                                                      color: Colors.grey,
                                                                    )),
                                                                  ),
                                                                ),
                                                                Text(
                                                                  "عرض الكل ",
                                                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              return lastItemVideos(index: index, myObject: myObject);
                                            }),
                                      ),
                                    );
                                  }
                                }),
                          );
                      }),
                ),
                Divider(),
                Padding(
                  padding: EdgeInsets.only(left: 25, top: 25, right: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'أخر الاخبار ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: kBlackColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  type: PageTransitionType.fadeIn,
                                  alignment: Alignment.center,
                                  duration: Duration(milliseconds: 400),
                                  child: NewsScreen(
                                    myNewsFuture: myNewsFuture,
                                  )));
                        },
                        child: Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color: Colors.white, border: Border()),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                              child: Text(
                                'عرض الكل',
                                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: FutureBuilder<List<MyNews>>(
                      future: myNewsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.data == null) return Loading();
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length < 3 ? snapshot.data.length : 3,
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => NewsScreenDetails(myNews: snapshot.data[index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 19),
                                  height: 81,
                                  width: MediaQuery.of(context).size.width - 50,
                                  child: Row(
                                    children: <Widget>[
                                      ClipRRect(
                                        child: Container(
                                          height: 81,
                                          width: 62,
                                          child: Image.network(
                                            "$BASE" + snapshot.data[index].imageUrl,
                                            fit: BoxFit.fitHeight,
                                          ),
                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kMainColor),
                                        ),
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                      ),
                                      SizedBox(
                                        width: 21,
                                      ),
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            "${snapshot.data[index].title}",
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: kBlackColor),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            "${snapshot.data[index].description}",
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text(
                                            intl.DateFormat("dd-M-yyyy  / HH:mm").format(snapshot.data[index].date),
                                            style: TextStyle(fontWeight: FontWeight.bold, color: kGreyColor),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }),
                ),
                Divider(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget lastItemVideos({index, myObject}) => AnimationConfiguration.staggeredList(
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
                  MyVideosList _videoList = MyVideosList();
                  _videoList.path = myObject.videosList[index].path;
                  _videoList.description = myObject.videosList[index].description;
                  _videoList.title = myObject.videosList[index].title;
                  _videoList.id = myObject.videosList[index].id;
                  _videoList.classSubjectId = myObject.videosList[index].classSubjectId;
                  _videoList.classSubject = myObject.videosList[index].classSubject;
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fadeIn,
                          alignment: Alignment.center,
                          duration: Duration(milliseconds: 400),
                          child: YoutubeDetails(
                            youtubeFiles: _videoList,
                          )));
                },
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: -25,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: YoutubePlayer(
                        progressIndicatorColor: Colors.blueAccent,
                        controller: YoutubePlayerController(
                          flags: YoutubePlayerFlags(enableCaption: false, autoPlay: false, hideControls: true, mute: true, disableDragSeek: true, controlsVisibleAtStart: false),
                          initialVideoId: '${YoutubePlayer.convertUrlToId("${myObject.videosList[index].path}")}',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 0,
                      bottom: 0,
                      right: 0,
                      left: 0,
                      child: Container(
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
                                label: Text("${myObject.videosList[index].classSubject}",
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
                                      "${myObject.videosList[index].title}  ",
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
                                      "${myObject.videosList[index].description} ",
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
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  Widget myFirstItem(index, myObject) => Container(
        width: 230,
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: GestureDetector(
            onTap: () {
              MyVideosList _videoList = MyVideosList();
              _videoList.path = myObject.videosList[index].path;
              _videoList.description = myObject.videosList[index].description;
              _videoList.title = myObject.videosList[index].title;
              _videoList.id = myObject.videosList[index].id;
              _videoList.classSubjectId = myObject.videosList[index].classSubjectId;
              _videoList.classSubject = myObject.videosList[index].classSubject;
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fadeIn,
                      alignment: Alignment.center,
                      duration: Duration(milliseconds: 400),
                      child: YoutubeDetails(
                        youtubeFiles: _videoList,
                      )));
            },
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: -25,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: YoutubePlayer(
                    progressIndicatorColor: Colors.blueAccent,
                    controller: YoutubePlayerController(
                      flags: YoutubePlayerFlags(enableCaption: false, autoPlay: false, hideControls: true, mute: true, disableDragSeek: true, controlsVisibleAtStart: false),
                      initialVideoId: '${YoutubePlayer.convertUrlToId("${myObject.videosList[index].path}")}',
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: Container(
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
                            label: Text("${myObject.videosList[index].classSubject}",
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
                                  "${myObject.videosList[index].title}  ",
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
                                  "${myObject.videosList[index].description} ",
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
                  ),
                )
              ],
            ),
          ),
        ),
      );
}
