import 'package:flutter/material.dart';
import 'package:flutterappparctice/models/nav_menu.dart';
import 'package:flutterappparctice/screens/facebook_feed.dart';
import 'package:flutterappparctice/screens/headlines_News.dart';
import 'package:flutterappparctice/screens/homepage.dart';
import 'package:flutterappparctice/screens/instagram_feed.dart';
import 'package:flutterappparctice/screens/onboarding.dart';
import 'package:flutterappparctice/screens/homepage.dart';
import 'package:flutterappparctice/screens/twitter_feed.dart';


class navigationdrawer extends StatefulWidget {
  @override
  _navigationdrawerState createState() => _navigationdrawerState();
}

class _navigationdrawerState extends State<navigationdrawer> {

  List<NavMenuItem> navigationMenu=[
    NavMenuItem('Explorer',()=>homescreen()),
    NavMenuItem('HeadLineNews',()=>headlineNews()),
    NavMenuItem('Twitter Feeds',()=>twitterFeed()),
    NavMenuItem('Instagram Feeds',()=>instagramfeeds()),
    NavMenuItem('FaceBook Feeds',()=>faceBookfeeds()),

  ];


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(padding: EdgeInsets.only(top: 75,left: 24),
        child: ListView.builder(itemBuilder: (context,position)
        {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: ListTile(
              title: Text(navigationMenu[position].title,style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 22,

              ),),
              trailing: Icon(Icons.keyboard_arrow_right,
              color: Colors.grey.shade400,),
              onTap: (){
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return navigationMenu[position].destination();
                }));

              },

            ),
          );
        },
        itemCount: navigationMenu.length,
        ),
      ),
    );
  }
}
