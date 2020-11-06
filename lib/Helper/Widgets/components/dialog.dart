import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ilearn/Helper/Widgets/custom_items/coming_soon.dart';

Future<bool> showMyDialog(context) {
  return showGeneralDialog(
      context: context,
      transitionDuration: Duration(milliseconds: 300),
      // DURATION FOR ANIMATION
      barrierLabel: 'favourite',
      barrierColor: Colors.black.withOpacity(0.5),
      //SHADOW EFFECT
      barrierDismissible: true,
      pageBuilder: (context, a1, a2) {
        return Dialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)), //this right here
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 10, top: 10, left: 10, bottom: 15),
                    child: new Text(
                      "قيد التطوير",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                      width: 300,
                      height: 300,
                      child: Expanded(child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: ComingSoon())))
                ],
              ),
            ),
          ),
        );
      });
}
