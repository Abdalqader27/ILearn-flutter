import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static const Color nearlyWhite = Color(0xFFFAFAFA);
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF2F3F8);
  static const Color nearlyDarkBlue = Color(0xFF2633C5);
  static Color colorCurve = Color.fromRGBO(97, 10, 165, 0.8);
  static const Color primaryColor = const Color(0xFFD01118);
  static const Color grayFolder = const Color(0xFFCFD8DC);
  static const Color grayFolder2= const Color(0xFF90A4AE);
  static const Color secondaryColor = const Color(0xFF000000);
  static const Color black = const Color(0xFF000000);
  static const Color grayOne = const Color(0xFFEEEEEE);
  static const Color grayTwo = const Color(0xFFDDDDDD);
  static const Color grayThree = const Color(0xFFB1B1B1);
  static const Color flatRed = const Color(0xFFF96133);
  static const Color flatOrange = const Color(0xFFFF9233);
  static const Color flatPurple = const Color(0xFF8E3DD1);
  static const Color flatDeepPurple = const Color(0xFF462066);
  static const Color nearlyBlue = Color(0xFF00b0ff);
    static const Color blueBerry = Color(0xFF0FB2C0);
  static const Color nearlyBlack = Color(0xFF213333);
  static const Color grey = Color(0xFF3A5160);
  static const Color dark_grey = Color(0xFF313A44);

  static const Color notWhite = Color(0xFFEDF0F2);

  static const Color darkText = Color(0xFF253840);
  static const Color darkerText = Color(0xFF17262A);
  static const Color lightText = Color(0xFF4A6572);
  static const Color deactivatedText = Color(0xFF767676);
  static const Color dismissibleBackground = Color(0xFF364A54);
  static const Color chipBackground = Color(0xFFEEF1F3);
  static const Color spacer = Color(0xFFF2F2F2);
  static const Color darkIcon = Color(0xFF7A7A91);

  static const Color titleTextColor = const Color(0xff1d2635);
  static const Color subTitleTextColor = const Color(0xff797878);

  static const Color skyBlue = Color(0xff2890c8);
  static const Color lightBlue = Color(0xff5c3dff);


  static const Color orange = Color(0xffE65829);
  static const Color red = Color(0xffF72804);

  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color darkgrey = Color(0xff747F8F);

  static const Color iconColor = Color(0xffa8a09b);
  static const Color yellowColor = Color(0xfffbba01);

  static const Color lightblack = Color(0xff5F5F60);
  static const String fontName = 'sst-arabic';
  static final korange= const Color(0xFFFF9933);
  static  final korangelite = const Color(0xFFFFBE83);
  static final kwhite = const Color(0xFFFFFFFF);
  static final kdarkBlue= const Color(0xFF333366);
  static  final kblack = const Color(0xFF000000);
    static  final kgreen = const Color(0xFF00e676);
        static  final dgreen = const Color(0xFF00c853);
  static final kgreyDark =  Colors.grey.shade700;
  static final kgreyFill =  Colors.grey.shade100;

  static const TextStyle caption = TextStyle(
    fontFamily: fontName,
    fontWeight: FontWeight.w400,
    fontSize: 12,
    letterSpacing: 0.2,
    color: lightText, // was lightText
  );
}
class TextTheme {
  const TextTheme();

  static TextStyle regularText = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.white);

  static TextStyle regularTextBlack = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w200,
          fontSize: 16,
          height: 1,
          color: Colors.black);

  static TextStyle regularTextPurple = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: AppTheme.flatDeepPurple);

  static TextStyle regularTextWhite = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.white);

  static TextStyle bigTitleLight = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w300,
          fontSize: 26,
          color: Colors.black);

  static TextStyle bigTitleSemiBold = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w500,
          fontSize: 26,
          color: Colors.black);

  static TextStyle titleSemiBoldPurple = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w600,
          fontSize: 20,
          color: AppTheme.flatPurple);

  static TextStyle titleRegularGray = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppTheme.grayThree);

  static TextStyle titleRegularBlack = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Colors.black);

  static TextStyle titleRegularOrange = TextStyle(
          fontFamily: "pop",
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: AppTheme.flatOrange);
}

