import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:shortly/models/shorten_url.dart';

class ShortenUrlData extends ChangeNotifier {
  List<ShortenUrl> _shortenUrlList = [
    ShortenUrl(shorten: 'shorten', url: 'url'),
    ShortenUrl(shorten: 'shorten1', url: 'url1'),
    ShortenUrl(shorten: 'shorten2', url: 'url2'),
  ];

  int get count => _shortenUrlList.length;

  UnmodifiableListView<ShortenUrl> get shortenUrlList =>
      UnmodifiableListView(_shortenUrlList);

  void add(ShortenUrl shortenUrl) {
    _shortenUrlList.add(shortenUrl);
    notifyListeners();
  }

  void remove(ShortenUrl shortenUrl) {
    _shortenUrlList.remove(shortenUrl);
    notifyListeners();
  }

  void copy(ShortenUrl shortenUrl) {
    Clipboard.setData(ClipboardData(text: shortenUrl.shorten));
    notifyListeners();
  }
}
