import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/myFonts.dart';
import 'package:ilearn/View/Quiz/QuizPage.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PointPage extends StatefulWidget {
  @override
  _PointPageState createState() => _PointPageState();
}

class _PointPageState extends State<PointPage> {
  int _pageIndex = 0;
  PageController _pageController;
  List<charts.Series<Payment, String>> seriesList;
  List<charts.Series<Sales, int>> lineData;
  List<charts.Series<Payment, String>> lineData2;

  final data = [
    Payment("05", 16),
    Payment("06", 38),
    Payment("07", 36),
    Payment("08", 41),
    Payment("09", 24),
  ];
  final salesData = [
    Sales(0, 16),
    Sales(1, 38),
    Sales(2, 36),
    Sales(3, 41),
    Sales(4, 24),
  ];

  final salesData2 = [
    Sales(0, 24),
    Sales(1, 34),
    Sales(2, 38),
    Sales(3, 23),
    Sales(4, 48),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.9);
    seriesList = [
      charts.Series<Payment, String>(id: "cost", domainFn: (v, _) => v.month, measureFn: (v, _) => v.cost, data: data),
    ];
    lineData = [
      charts.Series<Sales, int>(id: "1", domainFn: (p, _) => p.month, measureFn: (p, _) => p.cost, data: salesData),
      charts.Series<Sales, int>(id: "2", domainFn: (p, _) => p.month, measureFn: (p, _) => p.cost, data: salesData2)
    ];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, right: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "سجل الإحصائيات  ",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "راقب سجلك كل يوم لمراقبة نشاطك و تقدمك   ",
                    style: TextStyle(
                      color: Colors.indigo.withOpacity(.7),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(25, 15, 15, 25),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: 170,
                      height: 170,
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Theme.of(context).primaryColor.withAlpha(50),
                      ),
                      child: Lottie.asset(
                        'lotti_files/33187-rabbit-in-a-hat.json',
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'نقاطك ',
                          style: TextStyle(color: Theme.of(context).accentColor, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '6522 ',
                          style: TextStyle(
                            color: Colors.indigo,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '0 Steps'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                '9000 Steps'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          LinearPercentIndicator(
                            lineHeight: 8.0,
                            percent: 0.7,
                            linearStrokeCap: LinearStrokeCap.roundAll,
                            backgroundColor: Theme.of(context).accentColor.withAlpha(30),
                            progressColor: Theme.of(context).primaryColor,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                          ),
                          // Text(
                          //   'Steps Taken'.toUpperCase(),
                          //   style: TextStyle(
                          //     color: Theme.of(context).accentColor,
                          //     fontSize: 24,
                          //     fontWeight: FontWeight.bold,
                          //   ),
                          // ),
                          // Text(
                          //   'You walked 165 min today',
                          //   style: TextStyle(
                          //     color: Theme.of(context).accentColor,
                          //     fontSize: 16,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 25,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18.0, right: 18),
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    'أيام الحماسة ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '128',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' يوم ',
                                          style: TextStyle(
                                            fontFamily: MyFonts.sstArabic,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    'المستوى',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'فضي ',
                                    style: TextStyle(
                                      color: Theme.of(context).accentColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    'التيجان ',
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                          text: '102',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: Theme.of(context).accentColor,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        TextSpan(
                                          text: ' ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Divider(
                      height: 25,
                      color: Colors.grey[300],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            ' الإنجازات',
                            style: TextStyle(
                              color: Colors.indigo,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              // Image.asset(
                              //   'assets/img/down_orange.png',
                              //   width: 20,
                              // ),
                              Padding(
                                padding: EdgeInsets.only(right: 15),
                              ),
                              Text(
                                'عرض الكل ',
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                      child: ListView(
                        physics: ClampingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          StatCard(
                            title: 'الإجابات الكلية ',
                            achieved: 200,
                            total: 350,
                            color: Colors.deepPurpleAccent,
                            image: Image.asset('assets/img/bolt.png', width: 20),
                          ),
                          StatCard(
                            title: 'الإجابات الصحيحة',
                            achieved: 350,
                            total: 300,
                            color: Colors.green,
                            image: Image.asset('assets/img/fish.png', width: 20),
                          ),
                          StatCard(
                            title: 'الإجابات الخاطئة ',
                            achieved: 100,
                            total: 200,
                            color: Colors.orange,
                            image: Image.asset('assets/img/sausage.png', width: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String title;
  final double total;
  final double achieved;
  final Image image;
  final Color color;

  const StatCard({
    Key key,
    @required this.title,
    @required this.total,
    @required this.achieved,
    @required this.image,
    @required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 10),
      padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.grey[200],
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title.toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).accentColor.withAlpha(100),
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              achieved < total
                  ? Image.asset(
                      'assets/img/down_orange.png',
                      width: 20,
                    )
                  : Image.asset(
                      'assets/img/up_red.png',
                      width: 20,
                    ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          CircularPercentIndicator(
            radius: 80.0,
            lineWidth: 8.0,
            percent: achieved / (total < achieved ? achieved : total),
            circularStrokeCap: CircularStrokeCap.round,
            center: image,
            progressColor: color,
            backgroundColor: Theme.of(context).accentColor.withAlpha(30),
          ),
          Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          RichText(
            text: TextSpan(children: [
              TextSpan(
                text: achieved.toString(),
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).accentColor,
                ),
              ),
              TextSpan(
                text: ' / $total',
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
