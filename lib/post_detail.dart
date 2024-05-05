import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:sinhala_short_stories/http_service.dart';
import 'package:sinhala_short_stories/providers/favorite_story_provider.dart';
import 'package:sinhala_short_stories/services/firebase_service.dart';

import './posts_model.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  Post? post;
  String storyId;
  var isFavorite;

  PostDetail(this.storyId, {super.key});

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  void initState() {
    _getStory(widget.storyId);

    super.initState();
  }

  Future<void> _getStory(String id) async {
    var res = await FirebaseService().getStoryById(id);
    if (res == null) {
      return;
    }
    setState(() {
      widget.post = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.isFavorite = Provider.of<FavoriteStories>(context)
        .checkFavorite((widget.post?.id ?? -1).toString());

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
                  tag: widget.post?.title ?? '',
                  child: Material(
                      elevation: 15.0,
                      shadowColor: Colors.yellow.shade900,
                      child: Image.memory(
                        base64Decode(widget.post?.image ?? ''),
                        fit: BoxFit.cover,
                      )),
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
              text(widget.post?.title ?? '',
                  color: Colors.white,
                  size: 25,
                  isBold: true,
                  padding: const EdgeInsets.only(top: 16.0)),
              text(
                'කතුවරයා - ${widget.post?.author ?? ''}',
                color: Colors.white70,
                size: 15,
                padding: const EdgeInsets.only(top: 8.0, bottom: 16.0),
              ),
              ElevatedButton.icon(
                onPressed: !widget.isFavorite
                    ? () async {
                        await Provider.of<FavoriteStories>(context,
                                listen: false)
                            .addFavorite(
                                widget.post?.title ?? '',
                                (widget.post?.id ?? -1).toString(),
                                widget.post?.author ?? '',
                                widget.post?.image ?? '');
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    : () {},
                icon: const Icon(Icons.favorite),
                label: !widget.isFavorite
                    ? const Text('ප්‍රියතම ලැයිස්තුවට')
                    : const Text('ප්‍රියතම ලැස්තුවේ පවතී'),
              )
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
                widget.post?.story ?? '',
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
