import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shortly/components/custom_button.dart';
import 'package:shortly/models/shorten_url.dart';
import 'package:shortly/models/shorten_url_data.dart';

class ShortenTile extends StatefulWidget {
  final ShortenUrl shortenUrl;

  ShortenTile({@required this.shortenUrl});

  @override
  _ShortenTileState createState() => _ShortenTileState();
}

class _ShortenTileState extends State<ShortenTile> {
  bool _isCopied = false;

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
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Expanded(
                        child: Text(
                          widget.shortenUrl.url,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => data.remove(widget.shortenUrl),
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
                        widget.shortenUrl.shorten,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                    CustomButton(
                      title: _isCopied ? 'COPIED!' : 'COPY',
                      onPressed: () async {
                        await Clipboard.setData(
                            ClipboardData(text: widget.shortenUrl.shorten));
                        setState(() {
                          _isCopied = true;
                        });
                      },
                      height: 40.0,
                      titleFontSize: 18.0,
                      color:
                          _isCopied ? Theme.of(context).primaryColorDark : null,
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
