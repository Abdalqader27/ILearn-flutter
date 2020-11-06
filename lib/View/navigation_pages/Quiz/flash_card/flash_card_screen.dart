import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/components/title_text.dart';
import 'package:ilearn/Helper/Widgets/custom_items/loading.dart';
import 'package:ilearn/Models/my_flash_card.dart';
import 'flash_card_details_screen.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Resourse/hexa_color.dart';

class FlashCard extends StatefulWidget {
  @override
  _FlashCardState createState() => _FlashCardState();
}

class _FlashCardState extends State<FlashCard> {
  Future myFlashCard;

  @override
  void initState() => {myFlashCard = api.getMyFlashCard(3), super.initState()};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(left: 17.0, right: 17),
        child: FutureBuilder<List<MyFlashCard>>(
            future: myFlashCard,
            builder: (context, snapshot) {
              if (snapshot.data == null)
                return Center(child: Loading());
              else {
                List<MyFlashCard> myFlashCard = snapshot.data.where((element) => element.classId == 3).toList();
                if(myFlashCard.isEmpty)return Center(child: Text("لايوجد",style: TextStyle(fontWeight: FontWeight.bold)));
                return AnimationLimiter(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    itemCount: myFlashCard.length,
                    itemBuilder: (context, index) {
                      return AnimationConfiguration.staggeredList(
                          position: index,
                          duration: const Duration(milliseconds: 375),
                          child: ScaleAnimation(
                            child: _item(index, context, myFlashCard),
                          ));
                    },
                  ),
                );
              }
            }),
      ),
    );
  }

  Widget _item(index, BuildContext context, List<MyFlashCard> myFlashCard) {
    /// listCode is table form allCodes but ..where the univesity and material
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            PageTransition(
                type: PageTransitionType.rippleMiddle,
                alignment: Alignment.center,
                duration: Duration(milliseconds: 400),
                child: FlashCardDetails(
                  cardsList: myFlashCard[index],
                )));
      },
      child: Container(
        height: 80,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Row(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Stack(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        height: 70,
                        width: 70,
                        child: Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.bottomLeft,
                              child: Container(
                                decoration: BoxDecoration(color: HexColor("#f2f2f2").withOpacity(0.7), borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 5,
                      bottom: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
//                      child: Image.asset(
//                        "assets/folder2.png",
//                        height: 70,
//                      ),
                        child: SvgPicture.asset(
                          "SvgFiles/029-folder-11.svg",
                          height: 60,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: TitleText(
                          text: "${myFlashCard[index].subjectName}",
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      subtitle: Row(
                        children: <Widget>[
                          TitleText(
                            text: 'عدد الكارد  :',
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                          TitleText(
                            text: "${myFlashCard[index].cardsList.length}",
                            fontSize: 13,
                          ),
                        ],
                      ),
                      trailing: Container(
                        width: 35,
                        height: 35,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: lightGrey.withAlpha(150).withOpacity(0.4), borderRadius: BorderRadius.circular(10)),
//                        child: TitleText(
//                          text: 'x${data[index].repeatQuizCount}',
//                          fontSize: 12,
//                        ),
                        child: Icon(Icons.arrow_forward_ios),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
