import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sensor_app/drawer.dart';
import 'package:sensor_app/providers/favorite_story_provider.dart';

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
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child: Consumer<FavoriteStories>(
            child: Center(
              child: Text(
                'ප්‍රියතම කතා නොමැත.',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            builder: (context, story, ch) => story.getFavoriteStorie.length <= 0
                ? ch
                : ListView.builder(
                    itemBuilder: (ctx, i) => Card(
                      elevation: 4,
                      child: ListTile(
                        leading: Icon(Icons.bookmark),
                        title: Text(story.getFavoriteStorie[i].title),
                        trailing: Icon(Icons.arrow_forward_ios_sharp),
                      ),
                    ),
                    itemCount: story.getFavoriteStorie.length,
                  )),
      ),
    );
  }
}
