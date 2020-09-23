import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Helper/Widgets/custom_drawer/drawer_user_controller.dart';
import 'package:ilearn/Helper/Widgets/custom_drawer/home_drawer.dart';
import 'package:ilearn/View/DrawerView/About.dart';
import 'package:ilearn/View/DrawerView/FeedbackScreen.dart';
import 'package:ilearn/View/DrawerView/HelpScreen.dart';
import 'package:ilearn/View/DrawerView/InviteFriendScreen.dart';
import 'package:ilearn/View/Home/HomePage.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/View/MyApp/MyApp.dart';

class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;
  final myApp = MyApp();
  final helpScreen = HelpScreen();
  final feedbackScreen = FeedbackScreen();
  final inviteFriend = InviteFriend();
  final about = About();

  @override
  void initState() {
    drawerIndex = DrawerIndex.HOME;
    screenView = myApp;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => (drawerIndex ==  DrawerIndex.HOME),
      child: Container(
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: MediaQuery.of(context).size.width * 0.75,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexdata) {
              changeIndex(drawerIndexdata);
            },
            screenView: screenView,
          ),
        ),
      ),
    );
  }

  void changeIndex(DrawerIndex drawerIndexdata) {
    if (drawerIndex != drawerIndexdata) {
      drawerIndex = drawerIndexdata;
      if (drawerIndex == DrawerIndex.HOME) {
        setState(() => screenView = myApp);
      } else if (drawerIndex == DrawerIndex.Help) {
        setState(() => screenView = helpScreen);
      } else if (drawerIndex == DrawerIndex.FeedBack) {
        setState(() => screenView = feedbackScreen);
      } else if (drawerIndex == DrawerIndex.Invite) {
        setState(() => screenView = inviteFriend);
      } else if (drawerIndex == DrawerIndex.About) {
        setState(() => screenView = about);
      } else {
        //do in your way......
      }
    }
  }
}
