import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';

import 'package:ilearn/View/intro_pages/intro_page.dart';
import 'package:ilearn/View/navigation_pages/Home/navigation_home_screen.dart';

import 'package:provider/provider.dart';

import 'splash_screen_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  /// for provider state
  SplashScreenProvider appState;

  @override
  Widget build(BuildContext context) {
    /// we use ?? for if ( appState==null) just fill it with data else nothing todo
    appState ??= Provider.of<SplashScreenProvider>(context);

    return Scaffold(
        backgroundColor: white,
        body: PrimaryBackground(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    /// logo app
                    appState.myAppLogo(),
                    SizedBox(height: 20),

                    /// for app Name
                    appState.boldAppName(),

                    /// the text is having ( Study Smarter & Faster )
                    //       appState.textWriterAnimation(),
                  ],
                ),
              ),

              /// logo MockUpp
              // appState.logoMockTopLeft(),
              // appState.logoMockBottomRight(),
            ],
          ),
        ));
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      /// user objectiId you have to saved it
      // MyObjects.mySharedPrefsHelper.getSharedPreference("objectId", 0).then((value) {
      //   MyObjects.mySharedPrefsHelper.getSharedPreference("UniversitySelectID", 3).then((valueInt) {
      //     if (valueInt != -1) {
      //       Navigator.of(context).pop();
      //       Navigator.pushAndRemoveUntil(
      //         context,
      //         MaterialPageRoute(builder: (_) => MyApp()),
      //         ModalRoute.withName('/'),
      //       );
      //     } else {
      //       if (value != "") {
      //         Navigator.of(context).pop();
      //         Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(builder: (_) => SignYourMaterial()),
      //           ModalRoute.withName('/'),
      //         );
      //       } else {
      //         Navigator.of(context).pop();
      //
      //         Navigator.pushAndRemoveUntil(
      //           context,
      //           MaterialPageRoute(builder: (_) => SignApp()),
      //           ModalRoute.withName('/'),
      //         );
      //       }
      //     }
      //   });
      // });
      mySharedPrefs.get("user", 0).then((value) {
        print(value);
        Navigator.of(context).pop();
        if (value.toString().trim().length == 0) {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => IntroPage()),
            ModalRoute.withName('/'),
          );
        } else {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (_) => NavigationHomeScreen()),
            ModalRoute.withName('/'),
          );
        }
      });
    });
  }
}
