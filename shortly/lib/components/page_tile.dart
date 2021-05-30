import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const _radius = 40.0;

class PageTile extends StatelessWidget {
  PageTile(
      {@required this.title,
      @required this.description,
      @required this.iconPath});

  final String title;
  final String description;
  final String iconPath;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                margin: EdgeInsets.only(top: _radius, right: 10.0, left: 10.0),
                child: Material(
                  borderRadius: BorderRadius.all(Radius.circular(_radius / 2)),
                  color: Colors.white,
                  child: Container(
                    height: 280.0,
                    padding: EdgeInsets.all(16.0),
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        Text(
                          description,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CircleAvatar(
                radius: _radius,
                backgroundColor: Theme.of(context).primaryColorDark,
                child: SvgPicture.asset(iconPath),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
