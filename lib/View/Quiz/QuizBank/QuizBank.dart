import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:ilearn/Helper/Widgets/itemQuizBank.dart';
import 'package:ilearn/Model/ItemQuizBank.dart';
import 'package:ilearn/Model/itemMaterialQuizBank.dart';
import 'package:ilearn/View/Quiz/quiz_play.dart';

class QuizBank extends StatefulWidget {
  @override
  _QuizBankState createState() => _QuizBankState();
}

class _QuizBankState extends State<QuizBank> with TickerProviderStateMixin {
  AnimationController animationController;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  List<ItemMaterialQuizBank> myListMaterial = [
    ItemMaterialQuizBank(name: "العلم الأحياء", id: 0, myListQuizBank: [
      ItemQuizBank(title: "دورة 2018 ", paid: "مجاني ", lessonCount: 30, imagePath: "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2019 ", paid: "مدفوع ", lessonCount: 30, imagePath:  "SvgFiles/028-folder-12.svg"),
      ItemQuizBank(title: "دورة 2020 ", paid: "مدفوع ", lessonCount: 30, imagePath:  "SvgFiles/028-folder-12.svg"),
      ItemQuizBank(title: "دورة 2017 ", paid: "مجاني ", lessonCount: 30, imagePath: "SvgFiles/034-folder-6.svg"),
    ]),
    ItemMaterialQuizBank(name: "الرياضيات ", id: 0, myListQuizBank: [
      ItemQuizBank(title: "دورة 2018 ", paid: "مجاني ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2019 ", paid: "مدفوع ", lessonCount: 30, imagePath:  "SvgFiles/028-folder-12.svg"),
      ItemQuizBank(title: "دورة 2020 ", paid: "مدفوع ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2017 ", paid: "مجاني ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
    ]),
    ItemMaterialQuizBank(name: "الكيمياء ", id: 0, myListQuizBank: [
      ItemQuizBank(title: "دورة 2018 ", paid: "مجاني ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2019 ", paid: "مدفوع ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2020 ", paid: "مدفوع ", lessonCount: 30, imagePath: "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2017 ", paid: "مجاني ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
      ItemQuizBank(title: "دورة 2017 ", paid: "مجاني ", lessonCount: 30, imagePath:  "SvgFiles/034-folder-6.svg"),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView.builder(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),

          itemCount: myListMaterial.length,
          itemBuilder: (context, parentIndex) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0, right: 25, bottom: 13),
                          child: Text(
                            "${myListMaterial[parentIndex].name}",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        width: double.infinity,
                      ),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          child: FutureBuilder<bool>(
                            future: getData(),
                            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                              if (!snapshot.hasData) {
                                return const SizedBox();
                              } else {
                                return ListView.builder(
                                  physics: BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                                  itemCount: myListMaterial[parentIndex].myListQuizBank.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (BuildContext context, int index) {
                                    final int count = myListMaterial[parentIndex].myListQuizBank.length > 10 ? 10 : myListMaterial[parentIndex].myListQuizBank.length;
                                    final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                                        .animate(CurvedAnimation(parent: animationController, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
                                    animationController.forward();

                                    return ItemQuizBankWidget(
                                      itemQuizBank: myListMaterial[parentIndex].myListQuizBank[index],
                                      animation: animation,
                                      animationController: animationController,
                                      callback: () {
                                        Navigator.push(
                                            context, PageTransition(type: PageTransitionType.rippleRightUp, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: QuizPlay()));
                                      },
                                    );
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 1,
                  color: Colors.grey[300],
                ),
              ],
            );
          }),
    );
  }
}
