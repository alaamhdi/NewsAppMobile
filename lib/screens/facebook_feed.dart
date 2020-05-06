import 'package:flutter/material.dart';
import 'package:flutterappparctice/shared_UI/drawercontent.dart';

class faceBookfeeds extends StatefulWidget {
  @override
  _faceBookfeedsState createState() => _faceBookfeedsState();
}

class _faceBookfeedsState extends State<faceBookfeeds> {

  TextStyle _hashtagstyle = TextStyle(
    color: Colors.orange,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FaceBook Feeds'),
          centerTitle: false,
          actions: <Widget>[
            IconButton(icon: Icon(Icons.search), onPressed: () {})
          ],
        ),
        drawer: navigationdrawer(),
        body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemBuilder: (context, position) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    _drawerheader(),
                    _drawertitle(),
                    _drawerHashtag(),
                    _drawerbody(),
                    _drawerfooter(),
                  ],
                ),
              ),
            );
          },
          itemCount: 20,
        ));
  }


  Widget _drawerheader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
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
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
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
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey.shade400,
                ),
                onPressed: () {}),
            Transform.translate(
              offset: Offset(-10, 0),
              child: Text(
                '35',
                style: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 13,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _drawertitle() {
    return Padding(padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8),
      child: Text('We also talk about the future of work as the robots',style: TextStyle(
        color: Colors.grey.shade600,
      ),),
    );
  }

  Widget _drawerHashtag() {
    return Container(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: <Widget>[
          FlatButton(onPressed: (){}, child: Text('#advance',style: _hashtagstyle,)),
          FlatButton(onPressed: (){}, child: Text('#advance',style: _hashtagstyle,)),
          FlatButton(onPressed: (){}, child: Text('#advance',style: _hashtagstyle,)),

        ],
      ),
    );
  }

  Widget _drawerbody() {
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height*0.25,
      child: Image(image: ExactAssetImage('assets/images/Bac.JPG'),
        fit: BoxFit.cover,),

    );
  }

  Widget _drawerfooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(onPressed: (){}, child: Text('10 OMENT',style: _hashtagstyle,)),
        Row(
          children: <Widget>[
            FlatButton(onPressed: (){}, child: Text('SHARE',style: _hashtagstyle,)),
            FlatButton(onPressed: (){}, child: Text('OPEN',style: _hashtagstyle,)),
          ],
        ),



      ],
    );
  }
}

