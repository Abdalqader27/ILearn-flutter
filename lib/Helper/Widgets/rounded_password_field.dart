import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constantsColors.dart';
import 'package:ilearn/Helper/Widgets/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final int type;
  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this. type,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFieldContainer(
        child: TextField(
          obscureText: true,
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            hintText: type==0?"كلمة السر ":"‘إعادة كتابة كلمة السر",
            icon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            suffixIcon: Icon(
              Icons.visibility,
              color: kPrimaryColor,
            ),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
