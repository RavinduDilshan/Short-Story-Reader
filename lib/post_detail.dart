import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sinhala_short_stories/http_service.dart';
import 'package:sinhala_short_stories/providers/favorite_story_provider.dart';

import './posts_model.dart';
import 'package:flutter/material.dart';
import 'rating_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostDetail extends StatefulWidget {
  late Post post;
  int storyId;
  var isFavorite;

  PostDetail(this.storyId);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  void initState() {
    if (widget.storyId != null) {
      print(widget.storyId);
      _getStory(widget.storyId);
    } else {
      print('null is is');
    }

    super.initState();
  }

  Future<void> _getStory(int id) async {
    var res = await HttpService().getStoryById(id);
    setState(() {
      widget.post = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isFavorite = Provider.of<FavoriteStories>(context)
        .checkFavorite(widget.post.id.toString());

    const snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        'ප්‍රියතම ලැයිස්තුවට එක් කරන ලදී',
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.orange,
    );

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
      flexibleSpace: const Image(
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
              ..color = Colors.orange,
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
          padding: const EdgeInsets.all(16.0),
          child: widget.post == null
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Hero(
                  tag: widget.post.title,
                  child: Material(
                    elevation: 15.0,
                    shadowColor: Colors.yellow.shade900,
                    child: Image(
                      image: AssetImage(widget.post.image),
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
      children: widget.post == null
          ? <Widget>[
              const Center(
                child: CircularProgressIndicator(),
              )
            ]
          : <Widget>[
              text(widget.post.title,
                  color: Colors.white,
                  size: 25,
                  isBold: true,
                  padding: const EdgeInsets.only(top: 16.0)),
              text(
                'By ${widget.post.author}',
                color: Colors.white70,
                size: 15,
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              ),
              RaisedButton.icon(
                  onPressed: !widget.isFavorite
                      ? () async {
                          await Provider.of<FavoriteStories>(context,
                                  listen: false)
                              .addFavorite(
                                  widget.post.title,
                                  widget.post.id.toString(),
                                  widget.post.author);
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
                      : () {},
                  icon: const Icon(Icons.favorite),
                  label: !widget.isFavorite
                      ? const Text('ප්‍රියතම ලැයිස්තුවට')
                      : const Text('ප්‍රියතම ලැස්තුවේ පවතී'),
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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("res/containerBG.jpg"), fit: BoxFit.cover)),
      padding: const EdgeInsets.only(bottom: 16.0),
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
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("res/containerBG.jpg"), fit: BoxFit.cover)),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: widget.post == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Text(
                widget.post.story,
                style: const TextStyle(
                    fontSize: 17.0, height: 1.5, color: Colors.white),
              ),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child: widget.post == null
            ? const Center(
                child: CircularProgressIndicator(
                  color: Colors.orange,
                ),
              )
            : Column(
                children: <Widget>[
                  if (MediaQuery.of(context).orientation ==
                      Orientation.portrait)
                    topContent,
                  Expanded(child: bottomContent)
                ],
              ),
      ),
    );
  }
}
