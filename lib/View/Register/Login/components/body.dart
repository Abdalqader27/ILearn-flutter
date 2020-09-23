import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Widgets/already_have_an_account_acheck.dart';
import 'package:ilearn/Helper/Widgets/rounded_button.dart';
import 'package:ilearn/Helper/Widgets/rounded_input_field.dart';
import 'package:ilearn/Helper/Widgets/rounded_password_field.dart';
import 'package:ilearn/View/Home/navigation_home_screen.dart';
import 'package:ilearn/View/Register/Signup/signup_screen.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/View/MyApp/MyApp.dart';
import 'package:lottie/lottie.dart';

import 'background.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
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

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return NavigationHomeScreen();
                    },
                  ),
                );

              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
    );
  }
}
