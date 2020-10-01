import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/custom_tab_indicator.dart';
import 'package:ilearn/Models/my_news.dart';

class NewsScreenDetails extends StatelessWidget {
  final MyNews myNews;

  NewsScreenDetails({Key key, @required this.myNews})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
        height: 49,
        color: Colors.transparent,
        child: FlatButton(
          color: kMainColor,
          onPressed: () {},
          child: Text(
            'Add to Library',
            style: GoogleFonts.openSans(
                fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
          ),
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: CustomScrollView(
            slivers: <Widget>[
            SliverAppBar(
            backgroundColor: kMainColor,
            expandedHeight: MediaQuery
                .of(context)
                .size
                .height * 0.5,
            flexibleSpace: Container(
              color: Colors.grey,
              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.5,
              child: Stack(
                children: <Widget>[
                Positioned(
                left: 25,
                top: 35,
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: kWhiteColor),
                    child: SvgPicture.asset(
                        'assets/icons/icon_back_arrow.svg'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  margin: EdgeInsets.only(bottom: 62),
                  width: 172,
                  height: 225,
                  child: Image.network(myNews.imageUrl),),
              ),

            ],
          ),
        ),
      ),
      SliverList(
          delegate: SliverChildListDelegate([
            Padding(
              padding: EdgeInsets.only(top: 24, left: 25),
              child: Text(
                myNews.title,
                style: GoogleFonts.openSans(
                    fontSize: 27,
                    color: kBlackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 7, left: 25),
              child: Text(
                myNews.className,
                style: GoogleFonts.openSans(
                    fontSize: 14,
                    color: kGreyColor,
                    fontWeight: FontWeight.w400),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: 7, left: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '\$',
                      style: GoogleFonts.openSans(
                          fontSize: 14,
                          color: kMainColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      myNews.date.toString(),
                      style: GoogleFonts.openSans(
                          fontSize: 32,
                          color: kMainColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )),
            Container(
              height: 28,
              margin: EdgeInsets.only(top: 23, bottom: 36),
              padding: EdgeInsets.only(left: 25),
              child: DefaultTabController(
                length: 3,
                child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: true,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kGreyColor,
                    labelStyle: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                    indicator: RoundedRectangleTabIndicator(
                        weight: 2, width: 30, color: kBlackColor),
                    tabs: [
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 39),
                          child: Text('Description'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 39),
                          child: Text('Reviews'),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.only(right: 39),
                          child: Text('Similar'),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
              child: Text(
                myNews.description,
                style: GoogleFonts.openSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: kGreyColor,
                  letterSpacing: 1.5,
                  height: 2,
                ),
              ),
            )
          ]))
      ],
    ),)
    ,
    )
    ,
    );
  }
}
