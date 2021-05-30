import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortly/models/shorten_url_data.dart';
import 'package:shortly/screens/main/shorten_tile.dart';

class ShortenList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ShortenUrlData>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Your Link History',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: data.count,
            itemBuilder: (context, index) {
              return ShortenTile(shortenUrl: data.shortenUrlList[index]);
            },
          ),
        ),
      ],
    );
  }
}
