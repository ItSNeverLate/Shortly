import 'package:flutter/material.dart';
import 'package:shortly/screens/benefits_screen.dart';
import 'package:shortly/screens/main_screen.dart';
import 'package:shortly/screens/start_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xFF2ACFCF),
        primaryColorDark: Color(0xFF3B3054),
        accentColor: Color(0xFFF46262),
        scaffoldBackgroundColor: Color(0xFFF0F1F6),
        fontFamily: 'Poppins',
      ),
      initialRoute: BenefitsScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        BenefitsScreen.id: (context) => BenefitsScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}
