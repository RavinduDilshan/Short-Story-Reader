import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'drawer.dart';

class contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.orange.shade500),
      flexibleSpace: Image(
        image: AssetImage('res/0.jpg'),
        fit: BoxFit.cover,
      ),
      elevation: .5,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed:(){}
      // ),
      title: Stack(children: [
        Text(
          'අපට කියන්න',
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.orange[400],
          ),
        ),
        Text(
          'අපට කියන්න',
          style: TextStyle(color: Colors.grey.shade800),
        ),
      ]),
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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.orange, width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.orange, width: 3.0),
                  ),
                  labelText: 'නම',
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.orange, width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(color: Colors.orange, width: 3.0),
                  ),
                  labelText: 'ඔබේ අදහස්',
                  labelStyle: TextStyle(color: Colors.orange),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(
                height: 32,
              ),
              FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.red)),
                child: Text(
                  'යවන්න',
                  style: TextStyle(fontSize: 20.0),
                ),
                color: Colors.orange,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
