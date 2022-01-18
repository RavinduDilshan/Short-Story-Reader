import 'package:flutter/material.dart';
import 'package:sensor_app/drawer.dart';

class FavoriteScreen extends StatelessWidget {
  final appBar = AppBar(
    iconTheme: IconThemeData(color: Colors.orange.shade500),
    flexibleSpace: Image(
      image: AssetImage('res/containerBG.jpg'),
      fit: BoxFit.cover,
    ),
    elevation: .5,
    // leading: IconButton(
    //   icon: Icon(Icons.menu),
    //   onPressed:(){}
    // ),
    title: Stack(children: [
      Text(
        'ප්‍රියතම කතා',
        style: TextStyle(
          fontFamily: 'sara',
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.orange[400],
        ),
      ),
      Text(
        'ප්‍රියතම කතා',
        style: TextStyle(color: Colors.grey.shade800, fontFamily: 'sara'),
      ),
    ]),
    // actions: <Widget>[
    //   IconButton(
    //     icon: Icon(Icons.search),
    //     onPressed: () {},
    //   )
    // ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: MyDrawer(),
      body: Center(child: Text('favorite screen')),
    );
  }
}
