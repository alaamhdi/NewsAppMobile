import 'package:flutter/material.dart';
import 'package:flutterappparctice/shared_UI/drawercontent.dart';

import 'homescreen/favouritpage.dart';
import 'homescreen/popularpage.dart';
import 'homescreen/whatspage.dart';

class headlineNews extends StatefulWidget {
  @override
  _headlineNewsState createState() => _headlineNewsState();
}

class _headlineNewsState extends State<headlineNews> with TickerProviderStateMixin{
  TabController _tabController;
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
    return  Scaffold(
      appBar: AppBar(

        title: Text('HeadLinesNews'),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          )
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
          favouritpagecontent(),
          popularpagecontent(),
          favouritpagecontent(),
        ],
        controller: _tabController,
      ),
      drawer: navigationdrawer(),
    );

  }
}
