import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/components/custom_button.dart';
import 'package:shortly/screens/benefits/index.dart';

class StartScreen extends StatelessWidget {
  static final id = 'start_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                SvgPicture.asset('images/logo.svg'),
                Container(
                  width: double.infinity,
                  child: SvgPicture.asset(
                    'images/illustration.svg',
                    alignment: Alignment.bottomRight,
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
                    'More than just shorter links',
                    textAlign: TextAlign.center,
                    style: _titleTextStyle,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                      'Build your brand\'s recognition and get detailed insights on how your links are performing',
                      textAlign: TextAlign.center,
                      style: _descriptionTextStyle),
                  SizedBox(
                    height: 20.0,
                  ),
                  CustomButton(
                    title: 'START',
                    onPressed: () =>
                        Navigator.pushNamed(context, BenefitsScreen.id),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const _titleTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w700,
);

const _descriptionTextStyle = TextStyle(
  fontSize: 15.0,
  fontWeight: FontWeight.w500,
);
