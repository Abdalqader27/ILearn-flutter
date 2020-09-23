import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ilearn/View/Register/Signup/components/background.dart';
import 'package:lottie/lottie.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: Background(
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            children: [
              AppBar(
                elevation: 0,
                backgroundColor: Colors.transparent,
                iconTheme: IconThemeData.fallback(),
              ),
              Lottie.asset(
                'lotti_files/29435-random-things.json',
                height: size.height * 0.35,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                      "قريباً ",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.03),
                    )),
              ),
              Center(
                  child: Text(
                    "قيد التطوير سوف يتم التحديث تطبيق عند الأنتهاء  ",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.height * 0.02),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
