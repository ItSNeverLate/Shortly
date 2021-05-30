import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'package:shortly/components/custom_button.dart';
import 'package:shortly/models/shorten_url.dart';
import 'package:shortly/models/shorten_url_data.dart';
import 'package:shortly/screens/main/empty_list.dart';
import 'package:shortly/screens/main/shorten_list.dart';
import 'package:shortly/service/shorten_service.dart';

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
    final _inputController = TextEditingController();

    void getShortLink(String url) async {
      var service = ShortenService();

      Response response = await service.getShortLink(url);

      if (response.statusCode == 201) {
        final result = jsonDecode(response.body);

        data.add(ShortenUrl(shorten: result['result']['short_link'], url: url));
        _inputController.text = '';
        setState(() {
          _link = '';
        });
      }
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: data.count > 0 ? ShortenList() : EmptyList()),
            Container(
              color: Theme.of(context).primaryColorDark,
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
                          controller: _inputController,
                          cursorColor: Colors.black,
                          textAlign: TextAlign.center,
                          style: _inputTextStyle,
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
                              getShortLink(_link.trim());
                            }
                          },
                        ),
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

const _inputTextStyle = TextStyle(
  fontWeight: FontWeight.bold,
  fontSize: 22.0,
  color: Colors.black,
);
