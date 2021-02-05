import 'package:flutter/material.dart';
import 'package:furkandemirel_proje/controller/constants.dart';
import 'package:furkandemirel_proje/screen/game_screen.dart';
import 'package:furkandemirel_proje/screen/welcome_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: GAME_TITLE,
      theme: themeApp,
      home: WelcomeScreen(),
    );
  }
}
