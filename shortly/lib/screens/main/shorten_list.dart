import 'package:flutter/material.dart';
import 'package:shortly/models/shorten_url.dart';
import 'package:shortly/screens/main/shorten_tile.dart';

class ShortenList extends StatelessWidget {
  final List<ShortenUrl> list;

  ShortenList({@required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return ShortenTile(
              shortenUrl: list[index], onCopy: () {}, onDelete: () {});
        },
      ),
    );
  }
}
