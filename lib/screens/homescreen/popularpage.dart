import 'package:flutter/material.dart';
import 'package:flutterappparctice/api/posts.dart';
import 'package:flutterappparctice/api/refactoryCode.dart';
import 'dart:async';
import 'package:flutterappparctice/models/post.dart';
import 'package:flutterappparctice/utilities/data_Utilties.dart';

class popularpagecontent extends StatefulWidget {
  @override
  _popularpagecontentState createState() => _popularpagecontentState();
}

class _popularpagecontentState extends State<popularpagecontent> {
  PostsAPII postsAPI=PostsAPII();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: postsAPI.fechPostbyCateforyid("3"),
      // ignore: missing_return
      builder: (context,AsyncSnapshot snapShot){
        switch (snapShot.connectionState){

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
            if(snapShot.hasError){
              return error(snapShot.error);
            }
            else{
              List<Post> post=snapShot.data;
              return ListView.builder(itemBuilder: (context,position){
                return Card(
                  child: _drawSingleRow(post[position]),
                );
              },
                itemCount: post.length,
              );
            }
            break;
        }

      },

    );

  }

  Widget _drawSingleRow( Post post) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(post.featuredImage),
                  fit: BoxFit.cover,
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Mad Man',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
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

}
