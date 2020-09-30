import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Themes/appTheme.dart';


class TitleText extends StatelessWidget {
  final String text;
  final double fontSize;
  final Color color;
  final FontWeight fontWeight;
  const TitleText(
      {Key key,
      this.text,
      this.fontSize = 18,
      this.color = AppTheme.titleTextColor,
      this.fontWeight = FontWeight.w800
      })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(


            fontSize: fontSize, fontWeight: fontWeight, color: color,fontFamily: 'sst-arabic'),softWrap: true,

    );
  }
}