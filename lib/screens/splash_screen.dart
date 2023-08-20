import 'dart:async';

import 'package:flutter/material.dart';
import 'package:grocery_app/screens/welcome_screen.dart';
import 'package:grocery_app/styles/colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    const delay = const Duration(seconds: 3);
    Future.delayed(delay, () => onTimerFinished());
  }

  void onTimerFinished() {
    Navigator.of(context).pushReplacement(new MaterialPageRoute(
      builder: (BuildContext context) {
        return WelcomeScreen();
      },
    ));
  }

 @override
Widget build(BuildContext context) {
  double iconSize = 200.0; // Adjust the size as needed
  return Scaffold(
    backgroundColor: AppColors.primaryColor,
    body: Center(
      child: splashScreenIcon(width: iconSize, height: iconSize),
    ),
  );
}

}

Widget splashScreenIcon({double width = 100, double height = 100}) {
  String iconPath = "assets/icons/splash_screen_icon.svg";
  return SvgPicture.asset(
    iconPath,
    width: width,
    height: height,
  );
}


