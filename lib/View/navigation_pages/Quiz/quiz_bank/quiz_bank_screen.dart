import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/custom_items/loading.dart';
import 'package:ilearn/Models/bank_question_module.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/custom_items/item_quiz_bank.dart';
import 'package:ilearn/View/navigation_pages/Quiz/quiz_bank/quiz_play.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class QuizBank extends StatefulWidget {
  @override
  _QuizBankState createState() => _QuizBankState();
}

class _QuizBankState extends State<QuizBank> with TickerProviderStateMixin {
  AnimationController animationController;
  Future myBankFuture;
  TextEditingController code = new TextEditingController();
  bool isTryForSendingCode = false;

  @override
  void initState() {
    animationController = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this);
    myBankRx.changeObject(api.getAllQuestionModule());

    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: StreamBuilder<Future>(
          stream: myBankRx.observableObject,
          builder: (context, snapshotP) {
            if (snapshotP.data == null) return Loading();
            return FutureBuilder<List<QuestionBankModule>>(
                future: snapshotP.data,
                builder: (context, snapshot) {
                  if (snapshot.data == null) return Center(child: Loading());
                  return ListView.builder(
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemCount: snapshot.data.length,
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
                                        "${snapshot.data[parentIndex].classSubjectName}",
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
                                      height: 90,
                                      width: double.infinity,
                                      child: FutureBuilder<bool>(
                                        future: getData(),
                                        builder: (BuildContext context, AsyncSnapshot<bool> snapshotChild) {
                                          if (!snapshotChild.hasData) {
                                            return const SizedBox();
                                          } else {
                                            return ListView.builder(
                                              physics: BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              padding: const EdgeInsets.only(top: 0, bottom: 0, right: 16, left: 16),
                                              itemCount: snapshot.data[parentIndex].subjectExamsList.length,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (BuildContext context, int index) {
                                                final int count = snapshot.data[parentIndex].subjectExamsList.length > 10 ? 10 : snapshot.data[parentIndex].subjectExamsList.length;
                                                final Animation<double> animation = Tween<double>(begin: 0.0, end: 1.0)
                                                    .animate(CurvedAnimation(parent: animationController, curve: Interval((1 / count) * index, 1.0, curve: Curves.fastOutSlowIn)));
                                                animationController.forward();
                                                // return Container(
                                                //   height: 100,
                                                //   child: Card(
                                                //     child: ListTile(
                                                //       title:Text( snapshot.data[parentIndex].subjectExamsList[index].subjectExamName),
                                                //     ),
                                                //   ),
                                                // );
                                                return ItemQuizBankWidget(
                                                  itemQuizBank: snapshot.data[parentIndex].subjectExamsList[index],
                                                  animation: animation,
                                                  animationController: animationController,
                                                  callback: () {
                                                    if (!snapshot.data[parentIndex].subjectExamsList[index].isActivated)
                                                      return showGeneralDialog(
                                                          context: context,
                                                          transitionDuration: Duration(milliseconds: 300),
                                                          // DURATION FOR ANIMATION
                                                          barrierColor: Colors.black.withOpacity(0.5),
                                                          //SHADOW EFFECT
                                                          pageBuilder: (context, a1, a2) {
                                                            return StatefulBuilder(builder: (BuildContext context, StateSetter setState) {
                                                              return Material(
                                                                color: Colors.transparent,
                                                                child: Padding(
                                                                  padding: EdgeInsets.only(top: 30, left: 22, right: 22, bottom: 30),
                                                                  child: Center(
                                                                    child: Container(
                                                                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(13))),
                                                                        padding: EdgeInsets.only(top: 30, left: 15, right: 15, bottom: 10),
                                                                        child: Directionality(
                                                                          textDirection: TextDirection.rtl,
                                                                          child: SingleChildScrollView(
                                                                            physics: ScrollPhysics(),
                                                                            child: Column(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              children: <Widget>[
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(bottom: 5),
                                                                                  child: Text(
                                                                                    'تفعيل كود ',
                                                                                    style: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.w700),
                                                                                  ),
                                                                                ),
                                                                                AbsorbPointer(
                                                                                  absorbing: isTryForSendingCode,
                                                                                  child: TextFormField(
                                                                                    decoration: InputDecoration(
                                                                                        border: OutlineInputBorder(
                                                                                          borderRadius: const BorderRadius.all(
                                                                                            const Radius.circular(10.0),
                                                                                          ),
                                                                                        ),
                                                                                        filled: true,
                                                                                        hintStyle: new TextStyle(color: Colors.grey[800]),
                                                                                        hintText: "أكتب الكود هنا ",
                                                                                        fillColor: Colors.white70),
                                                                                    controller: code,
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  height: 15,
                                                                                ),
                                                                                Container(
                                                                                  width: double.maxFinite,
                                                                                  child: Visibility(
                                                                                    visible: !isTryForSendingCode,
                                                                                    replacement: Center(
                                                                                      child: Align(
                                                                                        alignment: Alignment.center,
                                                                                        child: Container(
                                                                                          height: 160,
                                                                                          width: 160,
                                                                                          // color: Colors.red,
                                                                                          child: Lottie.asset(
                                                                                            'lotti_files/29435-random-things.json',
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    child: FlatButton(
                                                                                      padding: EdgeInsets.all(7.0),
                                                                                      shape:
                                                                                          new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(9.0), side: BorderSide(color: blueBerry)),
                                                                                      color: blueBerry,
                                                                                      splashColor: Colors.blue,
                                                                                      onPressed: () async {
                                                                                        isTryForSendingCode = false;
                                                                                        if (code.text.trim().length == 0) {
                                                                                          Toast.show("لايمكنك ترك الحقل فارغا ", context, duration: Toast.LENGTH_LONG);
                                                                                        } else {
                                                                                          setState(() => isTryForSendingCode = true);
                                                                                          bool res = await api.activeWithCode(
                                                                                              context, code.text, snapshot.data[parentIndex].subjectExamsList[index].subjectExamId);
                                                                                          if (res) {
                                                                                            myBankRx.changeObject(api.getAllQuestionModule());
                                                                                            setState(() => isTryForSendingCode = true);
                                                                                            Navigator.of(context).pop();
                                                                                            Navigator.push(
                                                                                                context,
                                                                                                PageTransition(
                                                                                                    type: PageTransitionType.rippleRightUp,
                                                                                                    alignment: Alignment.center,
                                                                                                    duration: Duration(milliseconds: 400),
                                                                                                    child: QuizPlay()));
                                                                                          } else
                                                                                            Toast.show("الكود غير صحيح ", context, duration: Toast.LENGTH_LONG);
                                                                                          setState(() => isTryForSendingCode = false);
                                                                                        }
                                                                                      },
                                                                                      child: Text(
                                                                                        ' تفعيل  ',
                                                                                        style: TextStyle(fontSize: 15, color: Colors.white),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        )),
                                                                  ),
                                                                ),
                                                              );
                                                            });
                                                          });
                                                    else
                                                      Navigator.push(
                                                          context,
                                                          PageTransition(
                                                              type: PageTransitionType.rippleRightUp, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: QuizPlay(item:snapshot.data[parentIndex],myIndex:index)));
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
                      });
                });
          }),
    );
  }
}
