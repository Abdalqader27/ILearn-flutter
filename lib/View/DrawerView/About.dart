
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ilearn/Helper/Constants/constantsColors.dart';

import 'package:ilearn/Helper/Themes/appTheme.dart';
import 'package:ilearn/Helper/Widgets/Components/customBottomClipper.dart';
import 'package:ilearn/Helper/Widgets/Components/myCliperCruves.dart';
import 'package:toast/toast.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncer;

class About extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutState();
  }
}

class AboutState extends State<About> {
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          child: new ListView(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              new ClipPath(
                clipper: MyClipper(),
                child: Container(
                  decoration: BoxDecoration(color:kPrimaryLightColor2),
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 0.0, bottom: 100.0),
                  child: Column(
                    children: <Widget>[
                      Directionality(
                        textDirection: TextDirection.ltr,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child:  AppBar(
                            // leading: new IconButton(
                            //   icon: new Icon(Icons.arrow_back_ios),
                            //   onPressed: () => Navigator.of(context).pop(),
                            // ),
                            leading: Container(),
                            elevation: 0,
                            backgroundColor: Colors.transparent,
                            title: Text("حول التطبيق "),
                            centerTitle: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Center(
                        child: Column(
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.circular(28.0),
                              child: Image.asset(
                                "assets/web_hi_res_512.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'تطبيق iLean ',
                                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 28),
                              child: Center(
                                  child: Text(
                                    "هو تطبيق علمي يهدف لفكرة دمج التكنولوجيا في التعليم وتسهيل آلية الاختبار والحل للطلبة للوصول لأفضل تجربة تعليمية .. يستهدف طلاب سوريا بمرحلتيه الثانوية والأعدادية  .. ",
                                 textAlign: TextAlign.center  , style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                                  )),
                            ),
                          ],
                        )),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,left: 135,right: 135),
                child: Divider(height: 10,thickness: 3,color: AppTheme.blueBerry),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        'إصدار التطبيق  0.1  ',
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      subtitle: null,
                      trailing: Icon(Icons.info),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 0.1,
                      ),
                    ),
                    ListTile(
                      onTap: () => Toast.show("لايوجد تغيرات ", context, duration: Toast.LENGTH_LONG),
                      title: Text(
                        "التغييرات",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      subtitle: null,
                      trailing: Icon(Icons.refresh),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 0.1,
                      ),
                    ),
                    ListTile(
//                      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => CertificatesScreen())),
                      title: Text(
                        "الشهادات",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      subtitle: null,
                      trailing: Icon(Icons.library_books),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 0.1,
                      ),
                    ),
                    ListTile(
                      onTap: () {
                        UrlLauncer.launch('https://quizx.flycricket.io/privacy.html');
                      },
                      title: Text(
                        "سياسة الخصوصية",
                        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
                      ),
                      subtitle: null,
                      trailing: Icon(Icons.lock_open),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 18.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 0.1,
                      ),
                    ),
                  ],
                ),
              ),

//              Padding(
//                padding: const EdgeInsets.all(24.0),
//                child: Container(
//                  height: 480,
//                  width: 400,
//                  decoration: BoxDecoration(
//                    borderRadius: new BorderRadius.all(
//                      Radius.circular(20.0),
//                    ),
//                  ),
//                  child: FancyBackgroundApp(),
//                ),
//              ),
            ],
          ),
        ),
      ),
    );
//  return Container();
  }
}
