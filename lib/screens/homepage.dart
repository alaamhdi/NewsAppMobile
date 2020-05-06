import 'package:flutter/material.dart';
import 'package:flutterappparctice/screens/homescreen/favouritpage.dart';
import 'package:flutterappparctice/screens/homescreen/popularpage.dart';
import 'package:flutterappparctice/screens/homescreen/whatspage.dart';
import 'package:flutterappparctice/shared_UI/drawercontent.dart';
import 'package:flutterappparctice/api/authors_api.dart';
// ignore: camel_case_types
class homescreen extends StatefulWidget {
  @override
  _homescreenState createState() => _homescreenState();
}

enum PopOutMenu{
 HELP,ABOUT,CONTACT,SETTING
}
// ignore: camel_case_types
class _homescreenState extends State<homescreen> with SingleTickerProviderStateMixin  {

  //
  TabController _tabController;
  AuthorsAPI authorsAPI =new AuthorsAPI();

  @override
  void initState() {
    super.initState();
     _tabController = TabController(
        initialIndex: 0, length: 3, vsync: this);
  }

  @override
  void dispose(){
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    authorsAPI.fetchAllAuthors();

    return Scaffold(
      appBar: AppBar(
        title: Text('Explorer'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          _popOutmenu(context),
        ],
        bottom: TabBar(
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              text: 'WHATS',
            ),
            Tab(
              text: 'POPULAR',

            ),
            Tab(
              text: 'FAVOURIT',

            ),
          ],
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          whatspagecontent(),
          popularpagecontent(),
          favouritpagecontent(),
        ],
        controller: _tabController,
      ),
      drawer: navigationdrawer(),
    );
  }

 Widget _popOutmenu(BuildContext context) {
    return PopupMenuButton<PopOutMenu>(itemBuilder: (context){
      return [
        PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.ABOUT,
            child: Text('ABOUT')),
        PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.CONTACT,
            child: Text('CONTACT'),),
        PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.HELP,
            child: Text('HELP'),),
        PopupMenuItem<PopOutMenu>(
            value: PopOutMenu.SETTING,
            child: Text('SETTING'),),

      ];
    },onSelected: (PopOutMenu menu){
      //TO DO:
    },icon: Icon(Icons.more_vert),
    );
  }
}
