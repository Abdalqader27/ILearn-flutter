import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Widgets/already_have_an_account_acheck.dart';
import 'package:ilearn/Helper/Widgets/rounded_button.dart';
import 'package:ilearn/Helper/Widgets/rounded_input_field.dart';
import 'package:ilearn/Helper/Widgets/rounded_password_field.dart';
import 'package:ilearn/View/Register/Login/login_screen.dart';
import 'package:ilearn/View/Register/Signup/components/or_divider.dart';
import 'package:ilearn/View/Register/Signup/components/social_icon.dart';
import 'package:lottie/lottie.dart';

import 'background.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "حساب جديد ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/signup.svg",
            //   height: size.height * 0.35,
            // ),
          //  Lottie.asset('lotti_files/12689-wyzard.json', height: size.height * 0.35,),
            Lottie.asset('lotti_files/23100-happy-bird.json', height: size.height * 0.35,),

            RoundedInputField(
              hintText: "ايميلك ",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
               type: 0,
              onChanged: (value) {},
            ),        RoundedPasswordField(
              type: 1,
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "تسجيل ",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
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
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
