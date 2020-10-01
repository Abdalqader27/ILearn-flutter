import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_fonts.dart';
import 'package:ilearn/View/drawer_pages/About.dart';
import 'package:ilearn/View/drawer_pages/feed_back_screen.dart';
import 'package:ilearn/View/drawer_pages/help_screen.dart';
import 'package:ilearn/View/drawer_pages/invite_friend_screen.dart';
import 'package:ilearn/View/my_app/my_app.dart';
import 'package:ilearn/View/navigation_pages/BotFiles/folder_bot_screen.dart';

import 'package:ilearn/View/navigation_pages/Home/home_page.dart';
import 'package:ilearn/View/navigation_pages/Quiz/quiz_page.dart';
import 'package:ilearn/View/navigation_pages/User/user_page.dart';
import 'package:ilearn/View/navigation_pages/playlist/videos_page.dart';
import 'package:ilearn/View/navigation_pages/statistics/statistics_page.dart';

/// for my widgets in bottom navigation
List<Widget> myWidgets = [HomePage(), FolderBotScreen(), VideoScreen(), QuizPage(), StatisticsPage(), UserPage()];

/// for my drawer widget in bottom navigation

List<Widget> myDrawerWidget = [MyApp(), HelpScreen(), FeedbackScreen(), InviteFriend(), About()];

ThemeData myThemeData() => ThemeData(
    fontFamily: sstArabic,
    bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)))));
