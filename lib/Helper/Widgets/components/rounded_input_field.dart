import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Constants/constants_colors.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final ValueChanged<String> onChanged,onSubmit;
  final VoidCallback onTap;
  final FocusNode node;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged, this.controller, this.onTap, this.onSubmit, this.node,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: TextFieldContainer(
        child: TextField(
          focusNode: node,
          onSubmitted: onSubmit,
          onTap: onTap,
          controller: controller,
          onChanged: onChanged,
          cursorColor: kPrimaryColor,
          decoration: InputDecoration(
            icon: Icon(
              icon,
              color: kPrimaryColor,
            ),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
