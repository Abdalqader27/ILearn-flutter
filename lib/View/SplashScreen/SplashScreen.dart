
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/View/Register/Signup/components/background.dart';
import 'package:ilearn/View/OnBoarding/intro_page.dart';

import 'package:provider/provider.dart';

import 'SplashScreenProvider.dart';

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
        backgroundColor: AppTheme.white,
        body: Background(
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
                    appState.textWriterAnimation(),
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
      Navigator.of(context).pop();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => IntroPage()),
        ModalRoute.withName('/'),
      );
    });
  }
}
