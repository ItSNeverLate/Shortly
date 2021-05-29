import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({@required this.title, @required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 60.0,
      elevation: 5.0,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      clipBehavior: Clip.antiAlias,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
