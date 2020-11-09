import 'file:///C:/Users/cami9/AndroidStudioProjects/KarmaG8Flutter/lib/ui/Login/login.dart';
import 'package:KarmaG8Flutter/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: "Nunito"),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: loginPage(),
        ),
      ),
    );
  }
}


