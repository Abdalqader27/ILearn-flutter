import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/background/second_background.dart';
import 'package:ilearn/Helper/Widgets/components/already_have_an_account_acheck.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_button.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_input_field.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_password_field.dart';
import 'package:ilearn/Models/user.dart';
import 'package:ilearn/View/navigation_pages/Home/navigation_home_screen.dart';
import 'package:ilearn/View/register/sign_up/signup_screen.dart';
import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email;
  TextEditingController password;

  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  bool sendOrder = false;

  @override
  void initState() {
    super.initState();
    email = TextEditingController();
    password = TextEditingController();
  }

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
              Lottie.asset(
                'lotti_files/26219-new-idea.json',
                height: size.height * 0.35,
              ),

              SizedBox(height: size.height * 0.03),
              RoundedInputField(
                controller: email,
                node: emailNode,
                onSubmit: (_) {
                  FocusScope.of(context).requestFocus(passwordNode);
                },
                hintText: "إيميلك ",
                onChanged: (value) {},
              ),
              RoundedInputField(
                controller: password,
                icon: Icons.remove_red_eye_outlined,
                hintText: "كلمة السر ",
                node: passwordNode,
                onSubmit: (_) {},
                onChanged: (value) {},
              ),
              Visibility(
                visible: !sendOrder,
                child: RoundedButton(
                    text: "دخول ",
                    press: () async {
                      if (email.text.trim().isEmpty || password.text.trim().isEmpty ) {
                        Toast.show("أنتبه !! أحد الحقول فارغة ", context, backgroundColor: Colors.lightBlueAccent);
                      } else {
                        setState(() => sendOrder = true);
                        bool result = await api.signIn(context, email.text,password.text);

                        if (result) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (_) => NavigationHomeScreen()),
                            ModalRoute.withName('/'),
                          );
                          setState(() => sendOrder = false);
                        } else {
                          setState(() => sendOrder = false);
                          Toast.show("حدث خطأ ما ", context);
                        }
                      }
                    }),
                replacement: Padding(
                  padding: const EdgeInsets.all(38.0),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 3.5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.indigo),
                    ),
                  ),
                ),
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
