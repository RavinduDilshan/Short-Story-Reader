import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed:(){}
      // ),
      title: Text('අපට කියන්න'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
    return Scaffold(
      drawer: MyDrawer(),
      appBar: appBar,
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: 'නම',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 32),
          TextField(
            decoration: InputDecoration(
              
              labelText: 'ඔබේ අදහස්',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 32,
          ),
          RaisedButton(
            child: Text(
              "යවන්න",
              style: TextStyle(fontSize: 20),
            ),
            onPressed: () {},
            color: Colors.blue,
            textColor: Colors.white,
            padding: EdgeInsets.all(8.0),
            splashColor: Colors.grey,
          )
        ],
      ),
    );
  }
}
