import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Helper/Widgets/components/Image_view.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/custom_tab_indicator.dart';
import 'package:ilearn/Models/my_news.dart';

class NewsScreenDetails extends StatelessWidget {
  final MyNews myNews;

  NewsScreenDetails({Key key, @required this.myNews}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                leading: Container(),
                backgroundColor: kMainColor,
                expandedHeight: MediaQuery
                    .of(context)
                    .size
                    .height * 0.3,
                flexibleSpace: Container(
                  color: Colors.grey,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height * 0.3,
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => ImageView(imageUrl: BASE + myNews.imageUrl)));
                          },
                          child: Container(
                            child: Hero(
                              tag: BASE + myNews.imageUrl,
                              child: CachedNetworkImage(
                                  imageUrl: BASE + myNews.imageUrl,

                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 25,
                        top: 35,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: kWhiteColor),
                            child: SvgPicture.asset('assets/icons/icon_back_arrow.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: SliverList(
                    delegate: SliverChildListDelegate([
                      Padding(
                        padding: EdgeInsets.only(top: 24, left: 25, right: 25),
                        child: Text(
                          "${myNews.title}",
                          style: TextStyle(fontSize: 27, color: kBlackColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 7, left: 25, right: 25),
                        child: Text(
                          "${myNews.className}",
                          style: TextStyle(fontSize: 14, color: kGreyColor, fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 7, left: 25, right: 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "${myNews.date.toString()}",
                                style: TextStyle(color: kMainColor, fontWeight: FontWeight.w600),
                              ),
                            ],
                          )),
                      Padding(
                        padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
                        child: Text(
                          "${myNews.description}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.5,
                            height: 1.5,
                          ),
                        ),
                      )
                    ])),
              )
            ],
          ),
        ),
      ),
    );
  }
}
