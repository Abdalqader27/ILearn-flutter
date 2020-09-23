import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilearn/Helper/Constants/myFonts.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../View/User/constants.dart';

class ProfileListItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool hasNavigation;
  final VoidCallback onTap;

  const ProfileListItem({
    Key key,
    this.icon,
    this.text,
    this.hasNavigation = true,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: kSpacingUnit.w * 5.5,
        margin: EdgeInsets.symmetric(
          horizontal: kSpacingUnit.w * 4,
        ).copyWith(
          bottom: kSpacingUnit.w * 2,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: kSpacingUnit.w * 2,
        ),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(kSpacingUnit.w * 2),
        ),
        child: InkWell(
          onTap: () => onTap(),
          child: Row(
            children: <Widget>[
              Icon(
                this.icon,
                size: kSpacingUnit.w * 2.5,
              ),
              SizedBox(width: kSpacingUnit.w * 1.5),
              Text(this.text, style: TextStyle(fontWeight: FontWeight.bold, fontFamily: MyFonts.sstArabic, fontSize: kSpacingUnit.w * 1.5)),
              Spacer(),
              if (this.hasNavigation)
                Icon(
                  LineAwesomeIcons.angle_left,
                  size: kSpacingUnit.w * 2.5,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
