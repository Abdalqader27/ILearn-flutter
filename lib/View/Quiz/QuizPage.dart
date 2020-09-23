import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constantsColors.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/View/Register/Login/components/background.dart';
import 'package:ilearn/View/Quiz/Examniation/Examnation.dart';
import 'package:ilearn/View/Quiz/FlashCard/FlashCard.dart';

import 'QuizBank/QuizBank.dart';

class Payment {
  final String month;
  final int cost;

  Payment(this.month, this.cost);
}

class Sales {
  final int month;
  final int cost;

  Sales(this.month, this.cost);
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> with SingleTickerProviderStateMixin {
  TabController _tabController;
  Widget fragmentWidget;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(initialIndex: 2, length: 3, vsync: this);
    fragmentWidget = QuizBank();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TabBar(
                controller: _tabController,
                labelColor: Colors.black,
                unselectedLabelColor: Color(0xFFAFB4C6),
                indicatorColor: kPrimaryLightColor2,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 4,

                // indicator: BoxDecoration(
                //   color: AppTheme.black.withOpacity(.5),
                //   borderRadius: BorderRadius.all(Radius.circular(30)),
                // ),
                isScrollable: true,
                physics: BouncingScrollPhysics(),
                onTap: (index) => setState(() => fragmentWidget = index == 0 ? ExamScreen() : index == 1 ? FlashCard() : QuizBank()),
                tabs: <Widget>[
                  Tab(
                    child: Text(
                      'اسئلة امتحانية ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'فلاش كارد',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'بنك الأسئلة ',
                      style: TextStyle(
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(child: fragmentWidget),
          )
          // FlipCard(
          //   direction: FlipDirection.HORIZONTAL, // default
          //   front: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Card(
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          //       elevation: 10,
          //       child: Container(
          //         height: MediaQuery.of(context).size.height / 3,
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               'ماهي الحدبة الحلقية ',
          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          //   back: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Card(
          //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
          //       elevation: 10,
          //       child: Container(
          //         height: MediaQuery.of(context).size.height / 3,
          //         child: Center(
          //           child: Padding(
          //             padding: const EdgeInsets.all(8.0),
          //             child: Text(
          //               'هي عبارة عن كذا وكذا  ',
          //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.deepPurple),
          //             ),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
