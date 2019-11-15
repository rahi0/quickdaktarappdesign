import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:quick_daktar/Navigation/navigation.dart';
import 'package:quick_daktar/Screen/IntroPage/IntroPage.dart';
import 'package:quick_daktar/Screen/SplashScreen/splashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //primarySwatch: Colors.blue,
      ),
      home: SplashScreen()//IntroPage()//Navigation(),
    );
  }
}