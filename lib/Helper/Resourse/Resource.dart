import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/myFonts.dart';
import 'package:ilearn/View/Folder/FolderBotPage.dart';
import 'package:ilearn/View/Home/HomePage.dart';
import 'package:ilearn/View/Points/PointPage.dart';
import 'package:ilearn/View/Quiz/QuizPage.dart';
import 'package:ilearn/View/User/UserPage.dart';
import 'package:ilearn/View/Videos/VideosScreen.dart';

/// for my widgets in bottom navigation
List<Widget> myWidgets = [HomePage(), FolderBotPage(), VideoScreen(), QuizPage(), PointPage(), UserPage(),];

ThemeData myThemeData()=>ThemeData(
    fontFamily: MyFonts.sstArabic,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)))));
