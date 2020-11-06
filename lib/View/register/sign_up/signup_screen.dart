import 'dart:convert';
import 'dart:io';
import 'package:date_format/date_format.dart';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/date_picker.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Resourse/shared_prefences.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:ilearn/Helper/Widgets/components/rounded_input_field.dart';
import 'package:ilearn/Helper/Widgets/custom_items/loading.dart';
import 'package:ilearn/Models/classes.dart';
import 'package:ilearn/Models/user.dart';
import 'package:ilearn/View/navigation_pages/Home/navigation_home_screen.dart';
import 'package:ilearn/View/register/sign_up/sign_up_steppers/UserDate.dart';
import 'package:ilearn/View/register/sign_up/sign_up_steppers/UserImage.dart';
import 'package:ilearn/View/register/sign_up/sign_up_steppers/UserName.dart';
import 'package:ilearn/View/register/sign_up/sign_up_steppers/email_passwor_user.dart';
import 'package:image_picker/image_picker.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/rounded_button.dart';

import 'package:lottie/lottie.dart';
import 'package:toast/toast.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  DateTime _selectedDateTime = DateTime.now();
  int _currentIndex = 0;
  bool sendOrder = false;
  static File _image;
  DateTime _datePicker;
  final List<String> items = <String>['حلب ', 'دمشق', '  تشرين', '  طرطوس', ' البعث', ' حماة'];
  Classes _selection;
  Future myClasses;

  // List<Widget> myContainerWidget = [
  //   EmailAndUserPassword(),
  //   UserName(),
  //   UserDate(),
  //   UserImage(),
  // ];
  // Future getImageProfile() async {
  //   File image = await ImagePicker.pickImage(source: ImageSource.gallery);
  //   setState(() => {_image = image, print('Selected image path' + _image.path.toString())});
  // }

  void getDate() async {
    _datePicker = await DatePicker.showSimpleDatePicker(context,
            titleText: "تعديل",
            confirmText: "تم",
            cancelText: "إلغاء",
            pickerMode: DateTimePickerMode.datetime,
            firstDate: DateTime(1960),
            lastDate: DateTime(2030),
            dateFormat: "dd-MM-yyyy",
            initialDate: DateTime.now()) ??
        "";
    birthday.text = formatDate(_datePicker, [yyyy, '-', mm, '-', dd]);
  }

// make image a file
  TextEditingController fullName;
  TextEditingController email;
  TextEditingController password;
  TextEditingController birthday;
  final emailNode = FocusNode();
  final passwordNode = FocusNode();
  final dateNode = FocusNode();

  void onBirthdayChange(DateTime birthday) {
    setState(() {
      _selectedDateTime = birthday;
    });
  }

  @override
  void initState() {
    super.initState();
    fullName = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    birthday = TextEditingController();
    myClasses = api.getAllClasses();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: PrimaryBackground(
        child: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Stack(
              children: [
                Positioned(
                  right: 0,
                  child: Lottie.asset(
                    'lotti_files/23100-happy-bird.json',
                    height: size.height * 0.20,
                  ),
                ),
                Center(
                  child: Column(
                    children: [
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

                      Padding(
                        padding: EdgeInsets.all(18.0),
                        child: Container(
                            width: 140.0,
                            height: 140.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: new DecorationImage(
                                image: _image == null ? new ExactAssetImage('assets/1.png') : new FileImage(_image),
                                fit: BoxFit.cover,
                              ),
                            )),
                      ),

                      RoundedInputField(
                        onSubmit: (_) {
                          FocusScope.of(context).requestFocus(emailNode);
                        },
                        controller: fullName,
                        icon: Icons.account_circle_outlined,
                        hintText: "الاسم الكامل ",
                        onChanged: (value) {},
                      ),
                      RoundedInputField(
                        node: emailNode,
                        onSubmit: (_) {
                          FocusScope.of(context).requestFocus(passwordNode);
                        },
                        controller: email,
                        icon: Icons.email_outlined,
                        hintText: "ايميلك ",
                        onChanged: (value) {},
                      ),
                      RoundedInputField(
                        controller: password,
                        icon: Icons.remove_red_eye_outlined,
                        hintText: "كلمة السر ",
                        node: passwordNode,
                        onSubmit: (_) {
                          FocusScope.of(context).requestFocus(dateNode);
                          getDate();
                        },
                        onChanged: (value) {},
                      ),
                      RoundedInputField(
                        onTap: () {
                          getDate();
                          FocusScope.of(context).requestFocus(null);
                        },
                        controller: birthday,
                        icon: Icons.date_range_outlined,
                        hintText: "المواليد",
                        node: dateNode,
                        onChanged: (value) {},
                      ),
                      FutureBuilder<List<Classes>>(
                          future: myClasses,
                          builder: (context, snapshot) {
                            if (snapshot.data == null) return Loading();
                            if (snapshot.data.isNotEmpty) _selection ??= snapshot.data[0];
                            return Directionality(
                              textDirection: TextDirection.rtl,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                                margin: EdgeInsets.symmetric(vertical: 10),

                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15), border: Border.all(color: kPrimaryColor, width: 0.2)),

                                // dropdown below..
                                child: DropdownButton<Classes>(
                                    value: _selection,
                                    icon: Icon(Icons.arrow_drop_down),
                                    iconSize: 42,
                                    underline: SizedBox(),
                                    onChanged: (Classes newValue) {
                                      setState(() {
                                        _selection = newValue;
                                      });
                                    },
                                    items: snapshot.data.map<DropdownMenuItem<Classes>>((Classes value) {
                                      return DropdownMenuItem<Classes>(
                                        value: value,
                                        child: Directionality(
                                          textDirection: TextDirection.rtl,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.school,
                                                color: Colors.grey,
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(value.name + " " + value.studyType),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }).toList()),
                              ),
                            );
                          }),

                      Visibility(
                        visible: !sendOrder,
                        child: RoundedButton(
                          text: "التالي  ",
                          press: () async {
                            if (fullName.text.trim().isEmpty || email.text.trim().isEmpty || password.text.trim().isEmpty || birthday.text.trim().isEmpty) {
                              Toast.show("أنتبه !! أحد الحقول فارغة ", context, backgroundColor: Colors.lightBlueAccent);
                            } else {
                              setState(() => sendOrder = true);
                              bool result = await api.signUp(context,
                                  username: email.text, classId: _selection.id, birthDate: birthday.text, password: password.text, fullName: fullName.text, deviceId: "dsadasd");

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
                          },
                        ),
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
                    ],
                  ),
                ),
              ],
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Container(
            //     height: size.height * 0.60,
            //     child: myContainerWidget[_currentIndex],
            //   ),
            // )

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
    );
  }
}
