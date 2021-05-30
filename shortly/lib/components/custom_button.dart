import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {@required this.title,
      @required this.onPressed,
      this.height = 55.0,
      this.titleFontSize = 25.0,
      this.color});

  final String title;
  final Function onPressed;
  final double height;
  final double titleFontSize;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: height,
      elevation: 5.0,
      color: color ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      clipBehavior: Clip.antiAlias,
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontSize: titleFontSize,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
