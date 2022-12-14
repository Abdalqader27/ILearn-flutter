import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_page_transition/page_transition_type.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Resourse/project_resources.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:lottie/lottie.dart';

import '../navigation_pages/Home/notification/notification_screen.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.portraitUp,
    // ]);
    /// call provider to get all your functions
    /// use this widget for on Back Pressed
    return WillPopScope(
      onWillPop: () async {
        AwesomeDialog(
            context: context,
            animType: AnimType.SCALE,
            dialogType: DialogType.INFO,
            btnCancelText: "لا",
            btnOkText: "نعم",
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'هل حقا تريد الخروج من التطبيق ..؟؟',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            title: 'تنبيه !!',
            desc: 'This is also Ignored',
            btnOkOnPress: () => SystemNavigator.pop(),
            btnCancelOnPress: () {})
          ..show();
        return false;
      },
      child: Scaffold(
        body: PrimaryBackground(
          child: Stack(
            children: [
              /// we see dynamic bubbles in background
              bubblesWidget(),
              Column(
                children: [
                  /// we see appbar and his action
                  AppBar(
                    backgroundColor: Colors.white.withOpacity(.01),
                    elevation: 0,
                    actions: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: IconButton(
                          icon: Icon(
                            Icons.notifications_none,
                            // AntDesign.getIconData('search1'),
                            color: Colors.black,
                          ),
                          onPressed: () =>
                              Navigator.push(context, PageTransition(type: PageTransitionType.fadeIn, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: NotificationScreen())),
                        ),
                      ),
                    ],
                    leading: Container(),
                  ),

                  /// for Fragment pages using $_currentIndex to select widget
                  Expanded(
                      child: StreamBuilder<int>(
                          stream: myAppBottomNavigation.observableObject,
                          builder: (context, snapshot) {
                            if (snapshot.data == null) return Container();
                            return myWidgets[snapshot.data];
                          })),
                ],
              ),
            ],
          ),
        ),

        /// bottom Navigation Controller
        bottomNavigationBar: buildCustomIconDesign(),
      ),
    );
  }

  Widget buildCustomIconDesign() => StreamBuilder<int>(
      stream: myAppBottomNavigation.observableObject,
      builder: (context, snapshot) {
        if (snapshot.data == null) return Container();
        return CustomNavigationBar(
          iconSize: 30.0,
          selectedColor: kPrimaryColor,
          strokeColor: Color(0x300c18fb),
          unSelectedColor: Colors.grey[600],
          backgroundColor: Colors.white,
          items: [
            CustomNavigationBarItem(
              icon: AntDesign.home,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.folderopen,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.playcircleo,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.book,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.barchart,
            ),
            CustomNavigationBarItem(
              icon: AntDesign.user,
            ),
          ],
          currentIndex: snapshot.data,
          onTap: (index) {
            myAppBottomNavigation.changeObject(index);
            // setState(() {
            //   currentIndex = index;
            // });
          },
        );
      });

  Widget bubblesWidget() => Positioned(top: 0, left: 0, right: 0, child: Opacity(opacity: .2, child: Lottie.asset("lotti_files/25765-bubble-sticky.json")));
}
