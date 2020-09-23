import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilearn/View/Settings/Settings.dart';
import 'package:ilearn/View/User/ActivitiesRecord/ActivitiesRecordScreen.dart';
import 'package:ilearn/View/User/CommonQuestions/CommonQuestionScreen.dart';
import 'package:ilearn/View/User/Favourite/FavouriteScreen.dart';
import 'package:ilearn/View/User/PersonalProfile/PersonalProfileScreen.dart';
import 'package:ilearn/View/User/TaskMenu/TaskMenuScreen.dart';
import 'file:///D:/_Andrid/My%20projects/ilearn/lib/Helper/Widgets/ProfileListItem.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'constants.dart';

class UserPage extends StatefulWidget {
  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: <Widget>[
          SizedBox(height: kSpacingUnit.w * 5),
          Expanded(
            child: ListView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                ProfileListItem(
                  icon: LineAwesomeIcons.user_shield,
                  text: 'الملف الشخصي ',
                  onTap: () =>
                      Navigator.push(context, PageTransition(type: PageTransitionType.slideZoomLeft, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: PersonalScreen())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.history,
                  text: 'سجل النشاطات ',
                  onTap: () => Navigator.push(
                      context, PageTransition(type: PageTransitionType.slideZoomLeft, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: ActivitiesRecordScreen())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.heart,
                  text: 'المفضلة',
                  onTap: () =>
                      Navigator.push(context, PageTransition(type: PageTransitionType.slideZoomLeft, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: FavouriteScreen())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.tasks,
                  text: 'قائمة المهام ',
                  onTap: () =>
                      Navigator.push(context, PageTransition(type: PageTransitionType.slideZoomLeft, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: TaskMenuScreen())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.cog,
                  text: 'الاعدادات ',
                  onTap: () => Navigator.push(context, PageTransition(type: PageTransitionType.slideZoomLeft, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: Settings())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.user_plus,
                  text: 'الاسئلة الشائعة',
                  onTap: () => Navigator.push(
                      context, PageTransition(type: PageTransitionType.slideZoomLeft, alignment: Alignment.center, duration: Duration(milliseconds: 400), child: CommonQuestionScreen())),
                ),
                ProfileListItem(
                  icon: LineAwesomeIcons.alternate_sign_out,
                  text: 'تسجيل الخروج',
                  hasNavigation: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
