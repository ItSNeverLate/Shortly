import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/components/custom_button.dart';

class MainScreen extends StatefulWidget {
  static final id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isValid = false;

  @override
  Widget build(BuildContext context) {
    String _link = '';

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                child: Column(
              children: [
                SizedBox(
                  height: 30.0,
                ),
                SvgPicture.asset('images/logo.svg'),
                Expanded(
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
            Container(
              color: Theme.of(context).primaryColorDark,
              height: 200.0,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    child: SvgPicture.asset(
                      'images/shape.svg',
                      alignment: Alignment.topRight,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(32.0),
                    child: Column(
                      children: [
                        TextField(
                          // controller: _text,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0,
                            color: Colors.black,
                          ),
                          onChanged: (value) {
                            _link = value;
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.all(12.0),
                            filled: true,
                            hintText: _isValid
                                ? 'Shorten a link here ...'
                                : 'Please add a link here',
                            hintStyle: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: _isValid
                                  ? Colors.grey[350]
                                  : Theme.of(context).errorColor,
                              fontSize: 22.0,
                            ),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CustomButton(
                            title: 'SHORTEN IT!',
                            onPressed: () {
                              if (_link.trim().length == 0) {}
                            })
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
