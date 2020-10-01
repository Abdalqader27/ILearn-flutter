import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:ilearn/Helper/Widgets/custom_items/loading.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/popularbook_model.dart';

import 'news_screen_details.dart';

class NewsScreen extends StatefulWidget {
  final Future myNewsFuture;

  const NewsScreen({Key key, this.myNewsFuture}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryBackground(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                  width: double.maxFinite,
                  child: Text(
                    "الأخبار ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                  ),
                ),
                Container(
                  child: FutureBuilder<List<MyNews>>(
                      future: widget.myNewsFuture,
                      builder: (context, snapshot) {
                        if (snapshot.data == null) return Loading();
                        return ListView.builder(
                            padding: EdgeInsets.only(top: 25, right: 25, left: 25),
                            physics: BouncingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.length,
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
                                  color: kBackgroundColor,
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 81,
                                        width: 62,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            image: DecorationImage(
                                              image: AssetImage(BASE + snapshot.data[index].imageUrl),
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
                            });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
