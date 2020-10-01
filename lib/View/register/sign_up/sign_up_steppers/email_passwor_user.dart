import 'package:flutter/material.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/rounded_input_field.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/rounded_password_field.dart';

class EmailAndUserPassword extends StatefulWidget {
  @override
  _EmailAndUserPasswordState createState() => _EmailAndUserPasswordState();
}

class _EmailAndUserPasswordState extends State<EmailAndUserPassword> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          RoundedInputField(
            hintText: "ايميلك ",
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            type: 0,
            onChanged: (value) {},
          ),
          RoundedPasswordField(
            type: 1,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}
