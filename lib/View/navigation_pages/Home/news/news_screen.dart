import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_keys.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:ilearn/Helper/Widgets/custom_items/loading.dart';
import 'package:ilearn/Models/my_news.dart';
import 'package:ilearn/Models/popularbook_model.dart';
import 'package:intl/intl.dart'as intl;

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
