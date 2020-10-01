import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Widgets/background/welcome_background.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_button.dart';
import 'package:ilearn/View/Register/Login/login_screen.dart';
import 'package:ilearn/View/register/sign_up/signup_screen.dart';
import 'package:lottie/lottie.dart';


class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Scaffold(
      body: WelcomeBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Directionality(
                textDirection: TextDirection.rtl,
                child: Text(
                  "أهلا بك في iLearn",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
                ),
              ),
              SizedBox(height: size.height * 0.05),
              // SvgPicture.asset(
              //   "assets/icons/chat.svg",
              //   height: size.height * 0.45,
              // ),
              Lottie.asset(
                'lotti_files/28705-student-university-character.json',
                height: size.height * 0.45,
              ),
              SizedBox(height: size.height * 0.05),
              RoundedButton(
                text: "تسجيل الدخول ",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "  إتشاء حساب  ",
                color: kPrimaryLightColor,
                textColor: Colors.black,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
