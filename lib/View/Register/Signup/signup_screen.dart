import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Widgets/already_have_an_account_acheck.dart';
import 'package:ilearn/Helper/Widgets/rounded_button.dart';
import 'package:ilearn/Helper/Widgets/rounded_input_field.dart';
import 'package:ilearn/Helper/Widgets/rounded_password_field.dart';
import 'package:ilearn/View/Register/Login/login_screen.dart';
import 'package:ilearn/View/Register/Signup/SginUpSteppers/UserDate.dart';
import 'package:ilearn/View/Register/Signup/SginUpSteppers/UserImage.dart';
import 'package:ilearn/View/Register/Signup/SginUpSteppers/UserName.dart';
import 'package:ilearn/View/Register/Signup/components/background.dart';
import 'package:lottie/lottie.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'SginUpSteppers/EmailAndPasswordUser.dart';
import 'package:cupertino_date_textbox/cupertino_date_textbox.dart';
import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime _selectedDateTime = DateTime.now();
  int _currentIndex = 0;
  List<Widget> myContainerWidget = [
    EmailAndUserPassword(),
    UserName(),
    UserDate(),
    UserImage(),
  ];

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(28.0),
                    child: Text(
                      "حساب جديد ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // SvgPicture.asset(
                  //   "assets/icons/signup.svg",
                  //   height: size.height * 0.35,
                  // ),
                  //  Lottie.asset('lotti_files/12689-wyzard.json', height: size.height * 0.35,),
                  Lottie.asset(
                    'lotti_files/23100-happy-bird.json',
                    height: size.height * 0.35,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: size.height * 0.60,
                      child: myContainerWidget[_currentIndex],
                    ),
                  )

                  // RoundedInputField(
                  //   hintText: "ايميلك ",
                  //   onChanged: (value) {},
                  // ),
                  // RoundedPasswordField(
                  //   type: 0,
                  //   onChanged: (value) {},
                  // ),
                  // RoundedPasswordField(
                  //   type: 1,
                  //   onChanged: (value) {},
                  // ),
                  // RoundedButton(
                  //   text: "تسجيل ",
                  //   press: () {},
                  // ),
                  // SizedBox(height: size.height * 0.03),
                  // AlreadyHaveAnAccountCheck(
                  //   login: false,
                  //   press: () {
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //         builder: (context) {
                  //           return LoginScreen();
                  //         },
                  //       ),
                  //     );
                  //   },
                  // ),
                  // OrDivider(),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: <Widget>[
                  //     SocalIcon(
                  //       iconSrc: "assets/icons/facebook.svg",
                  //       press: () {},
                  //     ),
                  //     SocalIcon(
                  //       iconSrc: "assets/icons/twitter.svg",
                  //       press: () {},
                  //     ),
                  //     SocalIcon(
                  //       iconSrc: "assets/icons/google-plus.svg",
                  //       press: () {},
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 10,
              right: 10,
              child: RoundedButton(
                text: "التالي  ",
                press: () {
                  setState(() {
                    if (_currentIndex == myContainerWidget.length - 1)
                      _currentIndex = 0;
                    else
                      _currentIndex++;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
