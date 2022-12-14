import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_transition/flutter_page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ilearn/Helper/Constants/constants_dimen.dart';
import 'package:ilearn/Helper/Constants/constants_objects.dart';
import 'package:ilearn/Helper/Widgets/custom_items/profile_list_item.dart';
import 'package:ilearn/View/intro_pages/intro_page.dart';
import 'package:ilearn/View/navigation_pages/User/personal_profile/personal_profile_screen.dart';
import 'package:ilearn/View/navigation_pages/User/settings/settings_screen.dart';
import 'package:ilearn/View/navigation_pages/User/task_menu/task_menu_screen.dart';

import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import 'activities_records/activitiese_record_screen.dart';
import 'common_questions/common_question_screen.dart';
import 'favourite/favourite_screen.dart';

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
                  onTap: () {
                    mySharedPrefs.setValue(type: 0, stringValue: "", key: "user");
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => IntroPage()),
                      ModalRoute.withName('/'),
                    );
                  },
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
