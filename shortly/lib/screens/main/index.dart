import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shortly/components/custom_button.dart';
import 'package:shortly/models/shorten_url.dart';
import 'package:shortly/screens/main/empty_list.dart';
import 'package:shortly/screens/main/shorten_list.dart';

class MainScreen extends StatefulWidget {
  static final id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isValid = true;
  List<ShortenUrl> _list = [
    ShortenUrl(shorten: 'shorten', url: 'url'),
    ShortenUrl(shorten: 'shorten1', url: 'url1'),
    ShortenUrl(shorten: 'shorten2', url: 'url2'),
  ];

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
                child:
                    _list.length > 0 ? ShortenList(list: _list) : EmptyList()),
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
                              // borderSide: BorderSide(
                              //   width: 10.0,
                              //   color: Colors.red,
                              // ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        CustomButton(
                          title: 'SHORTEN IT!',
                          onPressed: () {
                            setState(() {
                              _isValid = _link.trim().length != 0;
                            });
                          },
                        )
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
