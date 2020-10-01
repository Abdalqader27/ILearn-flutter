import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_fonts.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/rounded_button.dart';
import 'package:lottie/lottie.dart';

class ExamScreen extends StatefulWidget {
  @override
  _ExamScreenState createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  int _noOfQuestions;
  String _difficulty;
  bool processing;

  @override
  void initState() {
    super.initState();
    _noOfQuestions = 10;
    _difficulty = "easy";
    processing = false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Padding(
          padding: const EdgeInsets.only(left: 34.0, right: 34),
          child: ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: [
              Lottie.asset(
                'lotti_files/27729-waiting.json',
                height: size.height * 0.25,
              ),
              Divider(),
              Text(
                "اختر عدد الأسئلة ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 5.0),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 16.0,
                  spacing: 16.0,
                  children: <Widget>[
                    SizedBox(width: 0.0),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("10", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _noOfQuestions == 10 ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectNumberOfQuestions(10),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("20", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _noOfQuestions == 20 ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectNumberOfQuestions(20),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("30", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _noOfQuestions == 30 ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectNumberOfQuestions(30),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("40", style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _noOfQuestions == 40 ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectNumberOfQuestions(40),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "50",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _noOfQuestions == 50 ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectNumberOfQuestions(50),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Divider(),
              Text(
                "اختر مستوى الصعوبة ",
                style: TextStyle(fontFamily: sstArabic, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.center,
                  runAlignment: WrapAlignment.center,
                  runSpacing: 16.0,
                  spacing: 16.0,
                  children: <Widget>[
                    SizedBox(width: 0.0),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "مش تفرق ",
                          style: TextStyle(fontFamily: sstArabic, fontWeight: FontWeight.bold),
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _difficulty == null ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectDifficulty(null),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "سهل ",
                          style: TextStyle(fontFamily: sstArabic, fontWeight: FontWeight.bold),
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _difficulty == "easy" ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectDifficulty("easy"),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "متوسط ",
                          style: TextStyle(fontFamily: sstArabic, fontWeight: FontWeight.bold),
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _difficulty == "medium" ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectDifficulty("medium"),
                    ),
                    ActionChip(
                      label: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          "صعب ",
                          style: TextStyle(fontFamily: sstArabic, fontWeight: FontWeight.bold),
                        ),
                      ),
                      labelStyle: TextStyle(color: Colors.white),
                      backgroundColor: _difficulty == "hard" ? blueBerry : Colors.grey.shade400,
                      onPressed: () => _selectDifficulty("hard"),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              processing
                  ? CircularProgressIndicator()
                  : RoundedButton(
                      color: Colors.blueAccent,
                      text: "بدء  ",
                      press: _startQuiz,
                    ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }

  _selectNumberOfQuestions(int i) {
    setState(() {
      _noOfQuestions = i;
    });
  }

  _selectDifficulty(String s) {
    setState(() {
      _difficulty = s;
    });
  }

  void _startQuiz() async {
    // setState(() {
    //   processing=true;
    // });
    // try {
    //   List<Question> questions =  await getQuestions(widget.category, _noOfQuestions, _difficulty);
    //   Navigator.pop(context);
    //   if(questions.length < 1) {
    //     Navigator.of(context).push(MaterialPageRoute(
    //         builder: (_) => ErrorPage(message: "There are not enough questions in the category, with the options you selected.",)
    //     ));
    //     return;
    //   }
    //   Navigator.push(context, MaterialPageRoute(
    //       builder: (_) => QuizPage(questions: questions, category: widget.category,)
    //   ));
    // }on SocketException catch (_) {
    //   Navigator.pushReplacement(context, MaterialPageRoute(
    //       builder: (_) => ErrorPage(message: "Can't reach the servers, \n Please check your internet connection.",)
    //   ));
    // } catch(e){
    //   print(e.message);
    //   Navigator.pushReplacement(context, MaterialPageRoute(
    //       builder: (_) => ErrorPage(message: "Unexpected error trying to connect to the API",)
    //   ));
    // }
    // setState(() {
    //   processing=false;
    // });
  }
}
