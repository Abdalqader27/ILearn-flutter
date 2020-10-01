import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Constants/application_strings.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'package:ilearn/Helper/Widgets/components/text_style.dart';
import 'package:lottie/lottie.dart';


class SplashScreenProvider {
  Widget myAppLogo() => Lottie.asset('lotti_files/12689-wyzard.json');

  Widget textWriterAnimation() => TypewriterAnimatedTextKit(
        text: ["Study Smarter & Faster"],
        textStyle: TextStyle(fontSize: 20.0),
        speed: Duration(milliseconds: 70),
      );

  Widget boldAppName() => BoldText(
        APP_NAME,
        35.0,
       kdarkBlue,
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
