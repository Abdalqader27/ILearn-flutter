import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Resourse/hexa_color.dart';
import 'package:ilearn/Models/bank_question_module.dart';

class ItemQuizBankWidget extends StatelessWidget {
  const ItemQuizBankWidget({Key key, this.itemQuizBank, this.animationController, this.animation, this.callback}) : super(key: key);

  final VoidCallback callback;
  final SubjectExamsList itemQuizBank;
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  width: 230,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        child: Row(
                          children: <Widget>[
                            const SizedBox(
                              width: 48,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200].withOpacity(.6),
                                  borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                ),
                                child: Row(
                                  children: <Widget>[
                                    const SizedBox(
                                      width: 48,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: Column(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(top: 16),
                                              child: Text(
                                                itemQuizBank.subjectExamName,
                                                textAlign: TextAlign.right,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 16,
                                                ),
                                              ),
                                            ),
                                            const Expanded(
                                              child: SizedBox(),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(right: 16, bottom: 8),
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    '${itemQuizBank.examQuestionsList.length} سؤال ',
                                                    textAlign: TextAlign.left,
                                                    style: TextStyle(
                                                      fontWeight: FontWeight.w200,
                                                      fontSize: 12,
                                                      letterSpacing: 0.27,
                                                    ),
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
                          child: Row(
                            children: <Widget>[
                              ClipRRect(
                                borderRadius: const BorderRadius.all(Radius.circular(16.0)),
                                child:
                                AspectRatio(aspectRatio: 1.0, child: Container(child: SizedBox(width: 20, height: 20, child: SvgPicture.asset(itemQuizBank.isActivated?"SvgFiles/034-folder-6.svg":"SvgFiles/lock_folder.svg", width: 26, height: 26)))),
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

    // return AnimatedBuilder(
    //   animation: animationController,
    //   builder: (BuildContext context, Widget child) {
    //     return FadeTransition(
    //         opacity: animation,
    //         child: Transform(
    //           transform: Matrix4.translationValues(100 * (1.0 - animation.value), 0.0, 0.0),
    //           child: InkWell(
    //             splashColor: Colors.transparent,
    //             onTap: () {
    //               callback();
    //             },
    //             child: Directionality(
    //               textDirection: TextDirection.rtl,
    //               child: SizedBox(
    //                 width: 230,
    //                 child: Stack(
    //                   children: <Widget>[
    //                     Positioned.fill(
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(left: 18.0, right: 18),
    //                         child: Container(
    //                           child: Row(
    //                             children: <Widget>[
    //
    //                               Expanded(
    //                                 child: Container(
    //                                   decoration: BoxDecoration(
    //                                     color: Colors.grey[200].withOpacity(.6),
    //                                     borderRadius: const BorderRadius.all(Radius.circular(15.0)),
    //                                     // border: Border.all(
    //                                     //   color: AppTheme.blueBerry.withOpacity(.05)
    //                                     // )
    //                                   ),
    //                                   child: Row(
    //                                     children: <Widget>[
    //                                       Column(
    //                                         children: <Widget>[
    //                                           Padding(
    //                                             padding: const EdgeInsets.only(top: 16, right: 0),
    //                                             child: Container(
    //                                               child: Text(
    //                                                 itemQuizBank.subjectExamName,
    //                                                 softWrap: true,
    //                                                 textAlign: TextAlign.center,
    //                                                 style: TextStyle(
    //                                                   fontWeight: FontWeight.bold,
    //                                                 ),
    //                                               ),
    //                                             ),
    //                                           ),
    //
    //                                           Padding(
    //                                             padding: const EdgeInsets.only(right: 55, bottom: 0),
    //                                             child: Row(
    //                                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                               crossAxisAlignment: CrossAxisAlignment.center,
    //                                               children: <Widget>[
    //                                                 Expanded(
    //                                                   child: Text(
    //                                                     '${itemQuizBank.examQuestionsList.length} سؤال ',
    //                                                     textAlign: TextAlign.left,
    //                                                     style: TextStyle(
    //                                                       fontWeight: FontWeight.bold,
    //                                                       color: Colors.grey,
    //                                                     ),
    //                                                   ),
    //                                                 ),
    //                                               ],
    //                                             ),
    //                                           ),
    //                                           Row(
    //                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                             crossAxisAlignment: CrossAxisAlignment.start,
    //                                             children: <Widget>[
    //                                               Text(
    //                                                 '${itemQuizBank.subjectExamId}',
    //                                                 textAlign: TextAlign.left,
    //                                                 style: TextStyle(
    //                                                   fontWeight: FontWeight.bold,
    //                                                   color: blueBerry,
    //                                                 ),
    //                                               ),
    //                                             ],
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                               )
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                     Container(
    //                       child: Padding(
    //                         padding: const EdgeInsets.only(top: 24, bottom: 24, right: 16),
    //                         child: Row(
    //                           children: <Widget>[
    //                             ClipRRect(
    //                               borderRadius: const BorderRadius.all(Radius.circular(16.0)),
    //                               child: AspectRatio(
    //                                   aspectRatio: 1.0, child: Container(child: SizedBox(width: 20, height: 20, child: SvgPicture.asset("SvgFiles/034-folder-6.svg", width: 26, height: 26)))),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ));
    //   },
    // );
  }
}
