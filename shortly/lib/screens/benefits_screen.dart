import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:shortly/components/page_tile.dart';
import 'package:shortly/screens/main_screen.dart';

class BenefitsScreen extends StatelessWidget {
  static final id = 'benefits_screen';
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30.0),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset('images/logo.svg'),
              Expanded(
                child: PageView(
                  onPageChanged: (pageNumber) =>
                      _currentPageNotifier.value = pageNumber,
                  scrollDirection: Axis.horizontal,
                  children: [
                    PageTile(
                        title: 'Brand Recognitionss',
                        description: 'description',
                        iconPath: 'images/diagram.svg'),
                    PageTile(
                        title: 'Brand Recognitionss',
                        description: 'description',
                        iconPath: 'images/gauge.svg'),
                    PageTile(
                        title: 'Brand Recognitionss',
                        description: 'description',
                        iconPath: 'images/tools.svg'),
                  ],
                ),
              ),
              CirclePageIndicator(
                size: 12.0,
                selectedSize: 12.0,
                itemCount: 3,
                dotColor: Theme.of(context).scaffoldBackgroundColor,
                borderWidth: 4,
                borderColor: Colors.grey,
                currentPageNotifier: _currentPageNotifier,
              ),
              TextButton(
                  onPressed: () => Navigator.pushNamed(context, MainScreen.id),
                  child: Text(
                    'Skip',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
