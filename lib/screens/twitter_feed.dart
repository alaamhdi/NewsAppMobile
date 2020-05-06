import 'package:flutter/material.dart';
import 'package:flutterappparctice/shared_UI/drawercontent.dart';

class twitterFeed extends StatefulWidget {
  @override
  _twitterFeedState createState() => _twitterFeedState();
}

class _twitterFeedState extends State<twitterFeed> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Twitter Feeds'),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        drawer: navigationdrawer(),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemBuilder: (context, position) {
            return Padding(padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  children: <Widget>[
                    _headerCard(),
                    _bodyCard(),
                    _drawline(),
                    _footerCard(),
                  ],
                ),
              ),
            );
          },
          itemCount: 20,
        ));
  }

  Widget _headerCard() {
    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16),
          child: CircleAvatar(
            backgroundImage: ExactAssetImage('assets/images/Bac.JPG'),
            radius: 24,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  'Crisena Mechal Avatar',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  '@ch_merys',
                  style: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              '22 April 2020  17:30:25 PM',
              style: TextStyle(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _bodyCard() {
    return Padding(
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 8),
        child: Text(
          'Hey Every one . this is my first App on Mobile Application. and i study very hard to do this',
          style: TextStyle(
            color: Colors.grey.shade800,
            height: 1.2,
            fontSize: 18,
          ),
        ));
  }

  Widget _footerCard() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.repeat),
                  color: Colors.orange,
                  iconSize: 28,
                  onPressed: () {}),
              Text(
                '25',
                style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: 18,
                ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              FlatButton(
                onPressed: () {},
                child: Text(
                  'SHARE',
                  style: TextStyle(
                    color: Colors.orange,
                    fontSize: 18,
                  ),
                ),
              ),
              FlatButton(
                onPressed: () {},
                child: Text(
                  'OPEN',
                  style: TextStyle(color: Colors.orange, fontSize: 18),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _drawline() {
    return Container(
      height: 1,
      color: Colors.grey.shade200,
    );
  }
}
