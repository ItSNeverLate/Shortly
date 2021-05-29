import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  static final id = 'start_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(id),
      ),
    );
  }
}
