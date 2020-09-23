import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Helper/Widgets/TextStyles.dart';
import 'package:lottie/lottie.dart';

import '../../Helper/Constants/applicationStrings.dart';

class SplashScreenProvider {
  Widget myAppLogo() => Lottie.asset('lotti_files/12689-wyzard.json');

  Widget textWriterAnimation() => TypewriterAnimatedTextKit(
        text: ["Study Smarter & Faster"],
        textStyle: TextStyle(fontSize: 20.0, color: AppTheme.korange),
        speed: Duration(milliseconds: 70),
      );

  Widget boldAppName() => BoldText(
        ApplicationStrings.APP_NAME,
        35.0,
        AppTheme.kdarkBlue,
      );

  Widget logoMockTopLeft() => Positioned(
        right: -150,
        bottom: -100,
        child: SvgPicture.asset(
          "assets/logo.svg",
          height: 200,
          color: Colors.grey.withOpacity(.2),
          width: 200,
        ),
      );

  Widget logoMockBottomRight() => Positioned(
        left: -100,
        top: -40,
        child: SvgPicture.asset(
          "assets/logo.svg",
          height: 200,
          color: Colors.grey.withOpacity(.2),
          width: 200,
        ),
      );
}
