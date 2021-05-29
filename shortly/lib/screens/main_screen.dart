import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  static final id = 'main_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id),
      ),
    );
  }
}
