import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Model/ItemQuizBank.dart';
import 'package:ilearn/View/Home/design_course_app_theme.dart';

class ItemQuizBankWidget extends StatelessWidget {
  const ItemQuizBankWidget({Key key, this.itemQuizBank, this.animationController, this.animation, this.callback}) : super(key: key);

  final VoidCallback callback;
  final ItemQuizBank itemQuizBank;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
            child: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                callback();
              },
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SizedBox(
                  width: 240,
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left:18.0,right: 18),
                        child: Container(
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey[200].withOpacity(.6),
                                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                                    // border: Border.all(
                                    //   color: AppTheme.blueBerry.withOpacity(.05)
                                    // )
                                  ),
                                  child: Row(
                                    children: <Widget>[

                                      Expanded(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 16,left: 0),
                                              child: Text(
                                                itemQuizBank.title,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 18,
                                                ),
                                              ),
                                            ),
                                             Expanded(
                                              child: SizedBox(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 55, bottom: 0),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '${itemQuizBank.lessonCount} سؤال',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      color: Colors.grey,
                                                    ),
                                                  ),

                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:  EdgeInsets.only(bottom: 16, right: 55),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Text(
                                                    '${itemQuizBank.paid}',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.bold,

                                                      color: AppTheme.blueBerry,

                                                    ),
                                                  ),
                                                  // Container(
                                                  //   decoration: BoxDecoration(
                                                  //     color: DesignCourseAppTheme.nearlyBlue,
                                                  //     borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                                                  //   ),
                                                  //   child: Padding(
                                                  //     padding: const EdgeInsets.all(4.0),
                                                  //     child: Icon(
                                                  //       Icons.add,
                                                  //       color: DesignCourseAppTheme.nearlyWhite,
                                                  //     ),
                                                  //   ),
                                                  // )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(

                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 24, right: 16),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                child: AspectRatio(aspectRatio: 1.0, child:Container(
                                    child: SizedBox(
                                        width: 20,
                                        height: 20,
                                        child: SvgPicture.asset("${itemQuizBank.imagePath}",width: 26,height: 26)))),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
