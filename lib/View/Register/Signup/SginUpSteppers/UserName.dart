import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Widgets/rounded_input_field.dart';

class UserName extends StatefulWidget {
  @override
  _UserNameState createState() => _UserNameState();
}

class _UserNameState extends State<UserName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RoundedInputField(
            hintText: "اسم المستخدم  ",
            onChanged: (value) {},
          ),

        ],
      ),
    );
  }
}
