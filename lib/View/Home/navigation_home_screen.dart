import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Helper/Widgets/custom_drawer/drawer_user_controller.dart';
import 'package:ilearn/Helper/Widgets/custom_drawer/home_drawer.dart';
import 'package:ilearn/RxDart/DrawerNavigation.dart';
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
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    sliderAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (drawerIndex != DrawerIndex.HOME) drawerNavigation.changeObject(DrawerIndex.HOME);
        return true;
      },
      child: Container(
        child: Scaffold(
          backgroundColor: AppTheme.nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: 200,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexData) {
              if (drawerIndex != drawerIndexData) {
                drawerIndex = drawerIndexData;
                setState(() {
                  drawerNavigation.changeObject(drawerIndexData);
                });
              }
            },
            screenView: StreamBuilder(
              stream: drawerNavigation.observableObject,
              builder: (context, snapshot) {
                if (snapshot.data == null) return myApp;
                switch (snapshot.data) {
                  case DrawerIndex.HOME:
                    return myApp;
                  case DrawerIndex.Help:
                    return helpScreen;
                  case DrawerIndex.FeedBack:
                    return feedbackScreen;
                  case DrawerIndex.Invite:
                    return inviteFriend;
                  case DrawerIndex.About:
                    return about;
                  default:
                    {
                      return myApp;
                    }
                }
                //do in your way......
              },
            ),
          ),
        ),
      ),
    );
  }
}
