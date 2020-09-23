import 'package:flutter/material.dart';
import 'Helper/Resourse/Resource.dart';
import 'package:ilearn/View/SplashScreen/SplashScreen.dart';
import 'package:provider/provider.dart';

import 'Helper/Constants/myFonts.dart';
import 'View/SplashScreen/SplashScreenProvider.dart';

void main() async => {
      /// we ensure if the widget is init
      WidgetsFlutterBinding.ensureInitialized(),

      /// to support all widget and see provider class
      runApp(MultiProvider(
          providers: [
            /// this first screen
            Provider<SplashScreenProvider>(create: (_) => SplashScreenProvider()),

            /// this Fragment Controller
            // Provider<MyAppProvider>(create: (_) => MyAppProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,

            /// in resource class to get Styles
            theme: myThemeData(),
            home: SplashScreen(),
          )))
    };
