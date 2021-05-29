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
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins',
      ),
      initialRoute: StartScreen.id,
      routes: {
        StartScreen.id: (context) => StartScreen(),
        BenefitsScreen.id: (context) => BenefitsScreen(),
        MainScreen.id: (context) => MainScreen(),
      },
    );
  }
}
