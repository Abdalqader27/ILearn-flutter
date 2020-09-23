import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilearn/Helper/Constants/constantsColors.dart';
import 'package:ilearn/Helper/Constants/myFonts.dart';
import 'package:ilearn/Helper/Widgets/Components/customBottomClipper.dart';
import 'package:ilearn/Helper/Widgets/custom_tab_indicator.dart';
import 'package:ilearn/Model/newbook_model.dart';
import 'package:ilearn/Model/popularbook_model.dart';
import 'package:ilearn/View/Home/selected_book_screen.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                // Lottie.asset("lotti_files/22193-partly-cloudy.json", height: 100),
                // Center(
                //     child: Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 30),
                //   child: Center(
                //     child: Column(
                //       mainAxisSize: MainAxisSize.min,
                //       children: [
                //         Text(
                //           " صباح الخير ",
                //           style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                //         ),
                //         Center(
                //           child: Text(
                //             "أصحاب النفوس العظيمة دائماً ما يواجهون مقاومة عنيفة من أصحاب العقول البسيطة.",
                //             textAlign: TextAlign.center,
                //             style: TextStyle(fontWeight: FontWeight.w600, fontSize: 14, color: Colors.black.withOpacity(.5)),
                //           ),
                //         ),
                //         Divider(),
                //       ],
                //     ),
                //   ),
                // )),
                Padding(
                    padding: EdgeInsets.only(left: 25, top: 25, right: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'مرحبا بك ',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                        ),
                        // Text(
                        //   'حدد ماتريد مشاهدته أو قرائته ',
                        //   style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: kBlackColor),
                        // ),
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
                        left: 0,
                        top: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          'assets/svg/background_search.svg',
                          color: Colors.black,
                        ),
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
                  padding: EdgeInsets.only(left: 25, top: 20, right: 25),
                  child: Text(
                    'موخرا ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                ),
                Container(
                  height: 25,
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.only(left: 25),
                  child: DefaultTabController(
                    length: 2,
                    child: TabBar(
                        labelPadding: EdgeInsets.all(0),
                        indicatorPadding: EdgeInsets.all(0),
                        isScrollable: true,
                        labelColor: kBlackColor,
                        unselectedLabelColor: kGreyColor,
                        labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, fontFamily: MyFonts.sstArabic),
                        unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, fontFamily: MyFonts.sstArabic),
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
                          // Tab(
                          //   child: Container(
                          //     margin: EdgeInsets.only(right: 23),
                          //     child: Text('الاسئلة  '),
                          //   ),
                          // )
                        ]),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 21),
                  height: 210,
                  child: ListView.builder(
                      padding: EdgeInsets.only(left: 25, right: 6, bottom: 10),
                      itemCount: newbooks.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 19),
                          height: 210,
                          width: 153,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: kMainColor,
                              image: DecorationImage(
                                image: AssetImage(newbooks[index].image),
                              )),
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
                        'الاخبار  ',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: kBlackColor),
                      ),
                      Container(
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
                    ],
                  ),
                ),
                Container(
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                      physics: BouncingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: populars.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print('ListView Tapped');
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SelectedBookScreen(popularBookModel: populars[index]),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 19),
                            height: 81,
                            width: MediaQuery.of(context).size.width - 50,
                            color: kBackgroundColor,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  height: 81,
                                  width: 62,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                        image: AssetImage(populars[index].image),
                                      ),
                                      color: kMainColor),
                                ),
                                SizedBox(
                                  width: 21,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      populars[index].title,
                                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: kBlackColor),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      populars[index].author,
                                      style: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w400, color: kGreyColor),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$' + populars[index].price,
                                      style: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600, color: kBlackColor),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                ),
                Divider(),

                // Container(
                //   height: MediaQuery.of(context).size.height / 1.8,
                //   child: Stack(
                //     fit: StackFit.expand,
                //     children: [
                //       ClipPath(
                //         clipper: CurvedBottomClipper(),
                //         child: Container(
                //           color: Colors.indigoAccent,
                //           width: MediaQuery.of(context).size.width,
                //           child: Image.asset('assets/1028306.png', fit: BoxFit.cover),
                //         ),
                //       ),
                //       Padding(
                //         padding: EdgeInsets.only(left: 15, bottom: 10, right: 15),
                //         child: Align(
                //           alignment: Alignment.bottomCenter,
                //           child: Directionality(
                //             textDirection: TextDirection.rtl,
                //             child: Column(
                //               mainAxisSize: MainAxisSize.min,
                //               children: [
                //                 Text(
                //                   '  التعلم ',
                //                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                //                 ),
                //                 Text(
                //                   'هي  عملية تيسير التعلم أي اكتساب المعرفة والمهارات والمبادئ والمعتقدات والعادات. من وسائل التعليم هناك رواية القصص والنقاش والتدريس والتدريب والبحث  ',
                //                   maxLines: 2,
                //                   overflow: TextOverflow.ellipsis,
                //                   style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                //                 ),
                //                 FlatButton(
                //                     onPressed: () async {},
                //                     padding: EdgeInsets.all(7.0),
                //                     shape: new RoundedRectangleBorder(
                //                       borderRadius: new BorderRadius.circular(9.0),
                //                     ),
                //                     color: Colors.indigoAccent,
                //                     splashColor: Colors.blue,
                //                     child: Text(
                //                       'مشاهدة   ',
                //                       style: TextStyle(color: Colors.white),
                //                     )),
                //               ],
                //             ),
                //           ),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.only(top: 18.0, right: 18, bottom: 0, left: 10),
                //   child: ListView(
                //     shrinkWrap: true,
                //     physics: NeverScrollableScrollPhysics(),
                //     children: [
                //       Text(
                //         "موخر ا ",
                //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
