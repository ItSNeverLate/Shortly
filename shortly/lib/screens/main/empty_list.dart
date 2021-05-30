import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 32.0),
      children: [
        SvgPicture.asset('images/logo.svg'),
        Expanded(
            child: Column(
          children: [
            Container(
              child: SvgPicture.asset(
                'images/illustration.svg',
              ),
            ),
          ],
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Let\'s get started!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                'Paste your first link into the field to shorten it',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
