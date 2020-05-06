import 'package:flutter/material.dart';

class popularpagecontent extends StatefulWidget {
  @override
  _popularpagecontentState createState() => _popularpagecontentState();
}

class _popularpagecontentState extends State<popularpagecontent> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context,position){
      return Card(
        child: _drawSingleRow(),
      );
    },
      itemCount: 20,
    );

  }

  Widget _drawSingleRow() {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage('assets/images/Bac.JPG'),
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
                  'The World Global warnning Annual Summit',
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
                        Text('15 Min'),
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
