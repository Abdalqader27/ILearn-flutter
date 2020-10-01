import 'package:flutter/cupertino.dart';
import 'package:ilearn/Helper/Constants/constants_lotti_files.dart';
import 'package:lottie/lottie.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Lottie.asset(random_things, height: MediaQuery.of(context).size.height / 4.5);
}
