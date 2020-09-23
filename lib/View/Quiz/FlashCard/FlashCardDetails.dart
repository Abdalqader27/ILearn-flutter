import 'package:flip_card/flip_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Helper/Widgets/bottom_curve_painter.dart';
import 'package:ilearn/View/Register/Signup/components/background.dart';
import 'package:worm_indicator/shape.dart';
import 'package:worm_indicator/worm_indicator.dart';

class FlashCardDetails extends StatefulWidget {
  @override
  _FlashCardDetailsState createState() => _FlashCardDetailsState();
}

class _FlashCardDetailsState extends State<FlashCardDetails> {
  PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(viewportFraction: 0.85, keepPage: true);
  }

  Widget buildPageView() {
    return PageView.builder(
      pageSnapping: true,
      dragStartBehavior: DragStartBehavior.down,
      physics: AlwaysScrollableScrollPhysics(),
      controller: _controller,
      itemCount: 30,
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
                  'من وظائف القشرة المخية ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
              ),
            ),
            back: Card(
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Container(
                child: Center(child: Text('Back')),
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
      body: Background(
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
                              "المادة : فيزياء  ",
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              "العدد 30 ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          ListTile(
                            title: Text(
                              "المقروء  ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              " 12 ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Divider(),
                          Center(
                            child: Text(
                              "رقم الكارد : 10 ",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

              Positioned(top: 250, left: 0, bottom: 25, right: 0, child: buildPageView()),
              // buildExampleIndicatorWithShapeAndBottomPos(circleShape, 20),
              Opacity(
                opacity: 0.1,
                child: Container(
                  child: ClipPath(clipper: BottomShapeClipper(), child: Container(color: AppTheme.flatOrange)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
