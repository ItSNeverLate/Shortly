import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Column(
          children: [
            SizedBox(
              height: 30.0,
            ),
            Expanded(
              child: SvgPicture.asset(
                'images/illustration.svg',
              ),
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                'Let\'s get started!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Paste your first link into the field to shorten it',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
