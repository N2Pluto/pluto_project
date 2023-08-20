import 'package:flutter/material.dart';
import 'package:grocery_app/screens/splash_screen.dart';
import 'package:grocery_app/styles/theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: themeData,
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
      },
    );
  }
}