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
            num size = 14,
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
      elevation: .5,
      title: Text('මාවතේ ගීතය'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
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
      children: <Widget>[
        text(post.title,
            size: 16, isBold: true, padding: EdgeInsets.only(top: 16.0)),
        text(
          'by ${post.author}',
          color: Colors.black54,
          size: 12,
          padding: EdgeInsets.only(top: 8.0, bottom: 16.0),
        ),
        Row(
          children: <Widget>[
            // text(
            //   book.price,
            //   isBold: true,
            //   padding: EdgeInsets.only(right: 8.0),
            // ),
            RatingBar(rating: post.rating)
          ],
        ),
        SizedBox(height: 32.0),
        Material(
          borderRadius: BorderRadius.circular(20.0),
          shadowColor: Colors.blue.shade200,
          elevation: 5.0,
          child: MaterialButton(
            onPressed: () async {
             
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('postid', post.id.toString());
            },
            minWidth: 160.0,
            color: Colors.blue,
            child: text('පසුවට කියවන්න', color: Colors.white, size: 13),
          ),
        )
      ],
    );

    final topContent = Container(
      color: Theme.of(context).primaryColor,
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
      height: 420.0,
      child: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Text(
          post.story,
          style: TextStyle(fontSize: 13.0, height: 1.5),
        ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Column(
        children: <Widget>[topContent, bottomContent],
      ),
    );
  }
}
