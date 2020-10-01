import 'package:flutter/material.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/rounded_input_field.dart';

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
