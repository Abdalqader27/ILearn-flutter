import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Models/bank_question_module.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/custom_items/quiz_play_widgets.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/circular_button.dart';
import 'package:ilearn/Models/question_model.dart';

class QuizPlay extends StatefulWidget {
  final QuestionBankModule item;
  final int myIndex;

  const QuizPlay({Key key, this.item, this.myIndex}) : super(key: key);

  @override
  _QuizPlayState createState() => _QuizPlayState();
}

int _correct = 0;
int _incorrect = 0;
int _notAttempted = 0;
int total = 0;

/// Stream
Stream infoStream;

class _QuizPlayState extends State<QuizPlay> with SingleTickerProviderStateMixin {
  bool isLoading = true;
  AnimationController animationController;
  Animation degOneTranslationAnimation, degTwoTranslationAnimation, degThreeTranslationAnimation;
  Animation rotationAnimation;

  @override
  void initState() {
    if (infoStream == null) {
      infoStream = Stream<List<int>>.periodic(Duration(milliseconds: 100), (x) {
        return [_correct, _incorrect];
      });
    }

    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(CurvedAnimation(parent: animationController, curve: Curves.easeOut));
    super.initState();
    animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    infoStream = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.search,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        title: Container(
          width: double.maxFinite,
          child: Text(
            "${widget.item.classSubjectName} ",
            textDirection: TextDirection.rtl,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.transparent,
        brightness: Brightness.light,
        elevation: 0.0,
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  InfoHeader(
                    length: 4,
                  ),
                  ListTile(
                    // title: Text(
                    //  " ",
                    //   textDirection: TextDirection.rtl,
                    //   style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
                    // ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        textDirection: TextDirection.ltr,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            "${widget.item.subjectExamsList[widget.myIndex].subjectExamName}",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          CheckboxListTile(
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              "?????? ?????????????? ?????????????? ??????",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            value: false,
                            onChanged: (bool value) {},
                          ),
                          CheckboxListTile(
                            dense: false,
                            isThreeLine: false,
                            contentPadding: EdgeInsets.all(0),
                            title: Text(
                              "?????? ?????????????? ?????????????? ??????",
                              textDirection: TextDirection.rtl,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            value: false,
                            onChanged: (bool value) {},
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15, right: 15),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: " ?????????? ?????? ?????????????? ... ",
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: double.maxFinite,
                    decoration: BoxDecoration(color: blueBerry.withOpacity(0.6), borderRadius: BorderRadius.all(Radius.circular(15))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, right: 13, left: 13),
                      child: Text(
                        "???????? ?????????????? ????????????????  ",
                        textDirection: TextDirection.rtl,
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListView.builder(
                      itemCount: widget.item.subjectExamsList[widget.myIndex].examQuestionsList.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return QuizPlayTile(
                          questionModel: QuestionModel(
                            question: "${widget.item.subjectExamsList[widget.myIndex].examQuestionsList[index].question} ",
                            option1: "${widget.item.subjectExamsList[widget.myIndex].examQuestionsList[index].option1} ",
                            option2: "${widget.item.subjectExamsList[widget.myIndex].examQuestionsList[index].option2} ",
                            option3: "${widget.item.subjectExamsList[widget.myIndex].examQuestionsList[index].option3} ",
                            option4: "${widget.item.subjectExamsList[widget.myIndex].examQuestionsList[index].option4} ",
                            answered: false,
                            correctOption: "${widget.item.subjectExamsList[widget.myIndex].examQuestionsList[index].correctAnswer} ",
                          ),
                          index: index,
                        );
                      })
                ],
              ),
            ),
          ),
          Positioned(
              left: 30,
              bottom: 30,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(0), degOneTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degOneTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.blue,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('First Button');
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(-45), degTwoTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degTwoTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.black,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('Second button');
                        },
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset.fromDirection(getRadiansFromDegree(-90), degThreeTranslationAnimation.value * 100),
                    child: Transform(
                      transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value))..scale(degThreeTranslationAnimation.value),
                      alignment: Alignment.center,
                      child: CircularButton(
                        color: Colors.orangeAccent,
                        width: 50,
                        height: 50,
                        icon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        onClick: () {
                          print('Third Button');
                        },
                      ),
                    ),
                  ),
                  Transform(
                    transform: Matrix4.rotationZ(getRadiansFromDegree(rotationAnimation.value)),
                    alignment: Alignment.center,
                    child: CircularButton(
                      color: blueBerry,
                      width: 45,
                      height: 45,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      onClick: () {
                        if (animationController.isCompleted) {
                          animationController.reverse();
                        } else {
                          animationController.forward();
                        }
                      },
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}

class InfoHeader extends StatefulWidget {
  final int length;

  InfoHeader({@required this.length});

  @override
  _InfoHeaderState createState() => _InfoHeaderState();
}

class _InfoHeaderState extends State<InfoHeader> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: infoStream,
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Container(
                  height: 40,
                  margin: EdgeInsets.only(left: 14),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: <Widget>[
                      NoOfQuestionTile(
                        text: "?????????? ",
                        number: widget.length,
                      ),
                      NoOfQuestionTile(
                        text: "?????????????? ",
                        number: _correct,
                      ),
                      NoOfQuestionTile(
                        text: "??????????????",
                        number: _incorrect,
                      ),
                      NoOfQuestionTile(
                        text: "???????????? ??????????",
                        number: _notAttempted,
                      ),
                    ],
                  ),
                )
              : Container();
        });
  }
}

class QuizPlayTile extends StatefulWidget {
  final QuestionModel questionModel;
  final int index;

  QuizPlayTile({@required this.questionModel, @required this.index});

  @override
  _QuizPlayTileState createState() => _QuizPlayTileState();
}

class _QuizPlayTileState extends State<QuizPlayTile> {
  String optionSelected = "";

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Q${widget.index + 1} ${widget.questionModel.question}",
                style: TextStyle(fontSize: 17, color: Colors.black.withOpacity(0.8), fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              elevation: 0,
              margin: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      if (!widget.questionModel.answered) {
                        ///correct
                        if ("1" == widget.questionModel.correctOption.trim()) {
                          setState(() {
                            optionSelected="1";
                            widget.questionModel.answered = true;
                            _correct = _correct + 1;
                            _notAttempted = _notAttempted + 1;
                          });
                        } else {
                          setState(() {
                            optionSelected="1";
                            widget.questionModel.answered = true;
                            _incorrect = _incorrect + 1;
                            _notAttempted = _notAttempted - 1;
                          });
                        }
                      }
                    },
                    child: OptionTile(
                      option: "A",
                      description: "${widget.questionModel.option1}",
                      correctAnswer: widget.questionModel.correctOption,
                      optionSelected: optionSelected,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      print(optionSelected);
                      if (!widget.questionModel.answered) {
                        ///correct
                        if ("2"== widget.questionModel.correctOption.trim()) {
                          setState(() {
                            //optionSelected = widget.questionModel.option2;
                            optionSelected="2";
                            widget.questionModel.answered = true;
                            _correct = _correct + 1;
                            _notAttempted = _notAttempted + 1;
                          });
                        } else {
                          setState(() {
                            optionSelected="2";
                            widget.questionModel.answered = true;
                            _incorrect = _incorrect + 1;
                            _notAttempted = _notAttempted - 1;
                          });
                        }
                      }
                    },
                    child: OptionTile(
                      option: "B",
                      description: "${widget.questionModel.option2}",
                      correctAnswer: widget.questionModel.correctOption,
                      optionSelected: optionSelected,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!widget.questionModel.answered) {
                        ///correct
                        if ("3" == widget.questionModel.correctOption.trim()) {
                          setState(() {
                            optionSelected="3";
                            widget.questionModel.answered = true;
                            _correct = _correct + 1;
                            _notAttempted = _notAttempted + 1;
                          });
                        } else {
                          setState(() {
                            optionSelected="3";
                            widget.questionModel.answered = true;
                            _incorrect = _incorrect + 1;
                            _notAttempted = _notAttempted - 1;
                          });
                        }
                      }
                    },
                    child: OptionTile(
                      option: "C",
                      description: "${widget.questionModel.option3}",
                      correctAnswer: widget.questionModel.correctOption,
                      optionSelected: optionSelected,
                    ),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  GestureDetector(
                    onTap: () {
                      if (!widget.questionModel.answered) {
                        ///correct
                        if ("4" == widget.questionModel.correctOption.trim()) {
                          setState(() {
                            optionSelected="4";
                            widget.questionModel.answered = true;
                            _correct = _correct + 1;
                            _notAttempted = _notAttempted + 1;
                          });
                        } else {
                          setState(() {
                            optionSelected="4";
                            widget.questionModel.answered = true;
                            _incorrect = _incorrect + 1;
                            _notAttempted = _notAttempted - 1;
                          });
                        }
                      }
                    },
                    child: OptionTile(
                      option: "D",
                      description: "${widget.questionModel.option4}",
                      correctAnswer: widget.questionModel.correctOption,
                      optionSelected: optionSelected,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

double getRadiansFromDegree(double degree) {
  double unitRadian = 57.295779513;
  return degree / unitRadian;
}
