import 'package:flutter/material.dart';
import 'Helper/Resourse/project_resources.dart';
import 'package:provider/provider.dart';

import 'View/navigation_pages/Home/navigation_home_screen.dart';
import 'View/splash_screen/splash_screen.dart';
import 'View/splash_screen/splash_screen_provider.dart';

void main() async => {
      /// we ensure if the widget is init
      WidgetsFlutterBinding.ensureInitialized(),

      /// to support all widget and see provider class
      runApp(MultiProvider(
          providers: [
            /// this first screen
            Provider<SplashScreenProvider>(create: (_) => SplashScreenProvider())
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            /// in resource  packages class to get Styles
            theme: myThemeData(),
        home: SplashScreen(),
        //     home: NavigationHomeScreen(),
          )))
    };
