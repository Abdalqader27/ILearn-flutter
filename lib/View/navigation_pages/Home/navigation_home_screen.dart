import 'package:flutter/material.dart';
import 'package:ilearn/Framework/rxdart/drawer_navigation.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Resourse/project_resources.dart';
import 'package:ilearn/Helper/Widgets/custom_drawer/drawer_user_controller.dart';
import 'package:ilearn/Helper/Widgets/custom_drawer/home_drawer.dart';


class NavigationHomeScreen extends StatefulWidget {
  @override
  _NavigationHomeScreenState createState() => _NavigationHomeScreenState();
}

class _NavigationHomeScreenState extends State<NavigationHomeScreen> {
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;
  final myApp = myDrawerWidget[0];
  final helpScreen = myDrawerWidget[1];
  final feedbackScreen = myDrawerWidget[2];
  final inviteFriend = myDrawerWidget[3];
  final about = myDrawerWidget[4];

  @override
  void initState() => {
        drawerIndex = DrawerIndex.HOME,
        super.initState(),
      };

  @override
  void dispose() => {
        super.dispose(),
        sliderAnimationController.dispose(),
      };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (drawerIndex != DrawerIndex.HOME) drawerNavigation.changeObject(DrawerIndex.HOME);
        return false;
      },
      child: Container(
        child: Scaffold(
          backgroundColor: nearlyWhite,
          body: DrawerUserController(
            screenIndex: drawerIndex,
            drawerWidth: 200,
            animationController: (AnimationController animationController) {
              sliderAnimationController = animationController;
            },
            onDrawerCall: (DrawerIndex drawerIndexData) {
              if (drawerIndex != drawerIndexData) {
                drawerIndex = drawerIndexData;
                // setState(() {
                  drawerNavigation.changeObject(drawerIndexData);
                // });
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
