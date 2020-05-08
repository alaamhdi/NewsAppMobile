import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappparctice/api/posts.dart';
import 'package:flutterappparctice/api/refactoryCode.dart';
import 'package:flutterappparctice/models/post.dart';
import 'dart:async';
import 'package:flutterappparctice/utilities/data_Utilties.dart';

class whatspagecontent extends StatefulWidget {
  @override
  _whatspagecontentState createState() => _whatspagecontentState();
}

class _whatspagecontentState extends State<whatspagecontent> {
  PostsAPII postsAPI = PostsAPII();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _drawheader(),
          _drawTopStories(),
          _drawRecentUpdate(),
        ],
      ),
    );
  }

  Widget _drawheader() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.27,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: ExactAssetImage('assets/images/Bac.JPG'),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'AlaaMhdi Hasan',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24,
            ),
          ),
          Text(
            'This is Whats Page in first app ',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget _drawTopStories() {
    return Container(
      color: Color.fromARGB(25, 25, 25, 1),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
              padding: const EdgeInsets.only(bottom: 8, top: 10, left: 16),
              child: _drawSection('TopStories')),
          Padding(
            padding: EdgeInsets.all(0.8),
            child: Card(
              child: FutureBuilder(
                future: postsAPI.fechPostbyCateforyid("1"),
                // ignore: missing_return
                builder: (context, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                      return connectionError();
                      break;
                    case ConnectionState.waiting:
                      return loading();
                      break;
                    case ConnectionState.active:
                      return loading();
                      break;
                    case ConnectionState.done:
                      if (snapshot.error != null) {
                        return error(snapshot.error);
                      } else {
                        if (snapshot.hasData) {
                          List<Post> posts = snapshot.data;
                          if (posts.length >= 3) {
                            Post post1 = snapshot.data[0];
                            Post post2 = snapshot.data[1];
                            Post post3 = snapshot.data[2];
                            return Column(
                              children: <Widget>[
                                _drawSingleRow(post1),
                                _drawDivider(),
                                _drawSingleRow(post2),
                                _drawDivider(),
                                _drawSingleRow(post3),
                              ],
                            );
                          }
                        } else {
                          return noData();
                        }
                      }
                      break;
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _drawRecentUpdate() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: FutureBuilder(
        future: postsAPI.fechPostbyCateforyid("2"),
        // ignore: missing_return
        builder: (context, AsyncSnapshot snapShot) {
          switch (snapShot.connectionState) {
            case ConnectionState.none:
              return connectionError();
              break;
            case ConnectionState.waiting:
              return loading();
              break;
            case ConnectionState.active:
              return loading();
              break;
            case ConnectionState.done:
              if (snapShot.hasError) {
                return error(snapShot.error);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 16, bottom: 8),
                        child: _drawSection('Recent Update')),
                    _drawRecentUpdateCard(Colors.deepOrange,snapShot.data[0]),
                    _drawRecentUpdateCard(Colors.teal,snapShot.data[1]),
                    SizedBox(
                      height: 48,
                    ),
                  ],
                );
              }
              break;
          }
        },
      ),
    );
  }

  Widget _drawSection(String _title) {
    return Text(
      _title,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 18,
        fontWeight: FontWeight.w700,
      ),
    );
  }



  Widget _drawSingleRow(Post post) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 125,
            height: 125,
            child: Image.network(
              post.featuredImage,
              fit: BoxFit.cover,
            ), // تكدر تطبع هذا الرابط للكونسول ؟
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  post.title,
                  maxLines: 2,
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Michal Adams'),
                    Row(
                      children: <Widget>[
                        Icon(Icons.timer),
                        Text(parseHumanDateTime(post.dateWritten)),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _drawDivider() {
    return Container(
      color: Colors.grey.shade200,
      width: double.infinity,
      height: 1,
    );
  }

  Widget _drawRecentUpdateCard(Color color, Post post) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(post.featuredImage),
                    fit: BoxFit.cover)),
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.25,
          ),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16),
            child: Container(
              padding: EdgeInsets.only(left: 24, right: 24, top: 2, bottom: 2),
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(4)),
              child: Text(
                'SPORT',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
            child: Text(
              post.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 16),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.timer,
                  color: Colors.grey,
                  size: 16,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  parseHumanDateTime(post.dateWritten),
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }


  }



