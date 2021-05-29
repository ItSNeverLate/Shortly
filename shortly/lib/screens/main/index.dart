import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shortly/components/custom_button.dart';
import 'package:shortly/models/shorten_url.dart';
import 'package:shortly/models/shorten_url_data.dart';
import 'package:shortly/screens/main/empty_list.dart';
import 'package:shortly/screens/main/shorten_list.dart';

class MainScreen extends StatefulWidget {
  static final id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool _isValid = true;

  @override
  Widget build(BuildContext context) {
    String _link = '';
    final data = Provider.of<ShortenUrlData>(context);

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            data.count > 0
                ? Text(
                    'Your Link History',
                    style: TextStyle(fontSize: 20.0),
                  )
                : SvgPicture.asset('images/logo.svg'),
            Expanded(child: data.count > 0 ? ShortenList() : EmptyList()),
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
                            final isValid = _link.trim().length != 0;
                            setState(() {
                              _isValid = isValid;
                            });
                            if (isValid) {
                              data.add(
                                ShortenUrl(
                                    shorten: 'http:///',
                                    url: 'httppjhshjshsjhsjhshs'),
                              );
                            }
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
