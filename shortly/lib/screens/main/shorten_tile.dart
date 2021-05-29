import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/components/custom_button.dart';
import 'package:shortly/models/shorten_url.dart';
import 'package:shortly/models/shorten_url_data.dart';

class ShortenTile extends StatelessWidget {
  final ShortenUrl shortenUrl;

  ShortenTile({@required this.shortenUrl});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ShortenUrlData>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      shortenUrl.url,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => data.remove(shortenUrl),
                  )
                ],
              ),
              Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        shortenUrl.shorten,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    CustomButton(
                      title: 'COPY',
                      onPressed: () => data.copyToClipBoard(shortenUrl),
                      height: 40.0,
                      titleFontSize: 18.0,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
