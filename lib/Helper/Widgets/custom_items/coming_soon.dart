import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ilearn/Helper/Widgets/background/primary_background.dart';
import 'package:lottie/lottie.dart';

class ComingSoon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        child: PrimaryBackground(
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
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )),
              ),
              Center(
                  child: Text(
                    "قيد التطوير سوف يتم التحديث تطبيق عند الأنتهاء  ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
