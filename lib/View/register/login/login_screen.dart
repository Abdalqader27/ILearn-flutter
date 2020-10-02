import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:ilearn/Helper/Widgets/background/second_background.dart';
import 'package:ilearn/Helper/Widgets/components/already_have_an_account_acheck.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_button.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_input_field.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_password_field.dart';
import 'package:ilearn/View/navigation_pages/Home/navigation_home_screen.dart';
import 'package:ilearn/View/register/sign_up/signup_screen.dart';
import 'package:lottie/lottie.dart';


class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SecondBackground(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "تسجيل دخول ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              // SvgPicture.asset(
              //   "assets/icons/login.svg",
              //   height: size.height * 0.35,
              // ),
              Lottie.asset('lotti_files/26219-new-idea.json', height: size.height * 0.35,),

              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                hintText: "إيميلك ",
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                onChanged: (value) {},
              ),
              RoundedButton(
                text: "دخول ",
                press: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.rippleMiddle, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: NavigationHomeScreen()));

                },
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(context, PageTransition(type: PageTransitionType.slideZoomRight, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: SignUpScreen()));


                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
