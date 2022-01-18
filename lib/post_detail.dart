import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sensor_app/providers/favorite_story_provider.dart';

import './posts_model.dart';
import 'package:flutter/material.dart';
import 'rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  PostDetail({@required this.post});

  @override
  Widget build(BuildContext context) {
    ///create text widget
    text(String data,
            {Color color = Colors.black87,
            num size = 15,
            EdgeInsetsGeometry padding = EdgeInsets.zero,
            bool isBold = false}) =>
        Padding(
          padding: padding,
          child: Text(
            data,
            style: TextStyle(
                color: color,
                fontSize: size.toDouble(),
                fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
          ),
        );

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
          'මාවතේ ගීතය',
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.orange[400],
          ),
        ),
        Text(
          'මාවතේ ගීතය',
          style: TextStyle(color: Colors.grey.shade800),
        ),
      ]),
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {},
      //   )
      // ],
    );

    final topLeft = Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Hero(
            tag: post.title,
            child: Material(
              elevation: 15.0,
              shadowColor: Colors.yellow.shade900,
              child: Image(
                image: AssetImage(post.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );

    ///detail top right
    final topRight = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        text(post.title,
            color: Colors.white,
            size: 25,
            isBold: true,
            padding: EdgeInsets.only(top: 16.0)),
        text(
          'By ${post.author}',
          color: Colors.white70,
          size: 15,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        RaisedButton.icon(
            onPressed: () {
              Provider.of<FavoriteStories>(context, listen: false)
                  .addFavorite(post.title, post.id);
            },
            icon: Icon(Icons.favorite),
            label: Text('ප්‍රියතම ලැයිස්තුවට'),
            color: Colors.orange[400],
            textColor: Colors.white)
        // Row(
        //   children: <Widget>[
        //     // text(
        //     //   book.price,
        //     //   isBold: true,
        //     //   padding: EdgeInsets.only(right: 8.0),
        //     // ),
        //     // RatingBar(
        //     //   rating: post.rating,
        //     //   color: Colors.white,
        //     // )
        //   ],
        // ),
        // SizedBox(height: 32.0),
        // FlatButton(
        //   shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(18.0),
        //       side: BorderSide(color: Colors.red)),
        //   child: Text(
        //     'පසුවට කියවන්න',
        //     style: TextStyle(fontSize: 15.0),
        //   ),
        //   color: Colors.orange,
        //   textColor: Colors.white,
        //   onPressed: () {},
        // ),
      ],
    );

    final topContent = Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("res/containerBG.jpg"), fit: BoxFit.cover)),
      padding: EdgeInsets.only(bottom: 16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(flex: 2, child: topLeft),
          Flexible(flex: 3, child: topRight),
        ],
      ),
    );

    ///scrolling text description
    final bottomContent = Container(
      width: double.infinity,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("res/containerBG.jpg"), fit: BoxFit.cover)),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          post.story,
          style: TextStyle(fontSize: 17.0, height: 1.5, color: Colors.white),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        child: Column(
          children: <Widget>[
            if (MediaQuery.of(context).orientation == Orientation.portrait)
              topContent,
            Expanded(child: bottomContent)
          ],
        ),
      ),
    );
  }
}
