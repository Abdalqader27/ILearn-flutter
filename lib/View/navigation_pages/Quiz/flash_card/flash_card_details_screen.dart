import 'dart:math';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:ilearn/Models/my_flash_card.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/clipper/bottom_curve_painter.dart';
import 'package:worm_indicator/shape.dart';

class FlashCardDetails extends StatefulWidget {
  final MyFlashCard cardsList;

  const FlashCardDetails({Key key, this.cardsList}) : super(key: key);

  @override
  _FlashCardDetailsState createState() => _FlashCardDetailsState();
}

class _FlashCardDetailsState extends State<FlashCardDetails> {
  PageController _controller;
  int maxi=0;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.85, keepPage: true);
    widget.cardsList.cardsList= widget.cardsList.cardsList.reversed.toList();
    myFlashCard.changeObject(0);

  }

  Widget buildPageView() {
    return PageView.builder(
      pageSnapping: true,
      reverse: true,
      dragStartBehavior: DragStartBehavior.down,

      physics: AlwaysScrollableScrollPhysics(),
      controller: _controller,
      itemCount: widget.cardsList.cardsList.length,
      onPageChanged: (index) =>
          myFlashCard.changeObject(index),
      itemBuilder: (BuildContext context, int pos) {
        return SizedBox(
          width: 300,
          height: 300,
          child: FlipCard(
            direction: FlipDirection.HORIZONTAL, // default
            front: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                width: 300,
                height: 300,
                child: Center(
                    child: Text(
                      '${widget.cardsList.cardsList[pos].title}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
            ),
            back: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                child: Center(
                    child: Text(
                      '${widget.cardsList.cardsList[pos].description}',
                    )),
              ),
            ),
          ),
        );
      },
    );
  }

  // Widget buildExampleIndicatorWithShapeAndBottomPos(Shape shape, double bottomPos) {
  //   return Positioned(
  //     bottom: bottomPos,
  //     left: 0,
  //     right: 0,
  //     child: Container(
  //       height: 60,
  //       width: double.maxFinite,
  //       child: ListView(
  //         shrinkWrap: true,
  //         scrollDirection: Axis.horizontal,
  //         children: [
  //           WormIndicator(
  //             length: 30,
  //             controller: _controller,
  //             shape: shape,
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  // FlipCard(
  // direction: FlipDirection.HORIZONTAL, // default
  // front: Card(
  // elevation: 3,
  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  // child: Container(
  // width: 300,
  // height: 300,
  // child: Center(
  // child: Text(
  // 'من وظائف القشرة المخية ',
  // style: TextStyle(fontWeight: FontWeight.bold),
  // )),
  // ),
  // ),
  // back: Card(
  // elevation: 3,
  // shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
  // child: Container(
  // width: 300,
  // height: 300,
  // child: Center(child: Text('Back')),
  // ),
  // ),
  // ),

  @override
  Widget build(BuildContext context) {
    final circleShape = Shape(
      size: 10,
      shape: DotShape.Circle,
      spacing: 4,
    );
    return Scaffold(
      body: PrimaryBackground(
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                  bottom: 250,
                  left: 0,
                  top: 0,
                  right: 0,
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          ListTile(
                            leading: Icon(Icons.book),
                            title: Text(
                              "المادة : " + widget.cardsList.subjectName,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "العدد ${widget.cardsList.cardsList.length} ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          StreamBuilder<int>(
                            stream: myFlashCard.observableObject,
                            builder: (context, snapshot) {
                              if(snapshot.data==null)return Container();
                              else{
                                maxi=max(maxi,snapshot.data);
                                return ListTile(
                                  title: Text(
                                    "المقروء  ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    maxi.toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                );

                              }
                            }
                          ),
                          Divider(),
                          Center(
                            child: StreamBuilder<int>(
                                stream: myFlashCard.observableObject,
                                builder: (context, snapshot) {
                                  if (snapshot.data == null) return Container();
                                  return Text(
                                    "رقم الكارد:  " + (snapshot.data + 1).toString(),
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  );
                                }
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

              Positioned(top: 250,
                  left: 0,
                  bottom: 25,
                  right: 0,
                  child: buildPageView()),
              // buildExampleIndicatorWithShapeAndBottomPos(circleShape, 20),
              Opacity(
                opacity: 0.1,
                child: Container(
                  child: ClipPath(clipper: BottomShapeClipper(), child: Container(color: flatOrange)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
