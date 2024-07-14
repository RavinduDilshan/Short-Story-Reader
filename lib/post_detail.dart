import 'dart:async';
import 'dart:convert';

import 'package:provider/provider.dart';
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
      backgroundColor: Color(0xff5b5858),
    );

    ///scrolling text description
    final bottomContent = Container(
      width: double.infinity,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("res/containerBG.png"), fit: BoxFit.cover)),
      child: widget.post == null
          ? SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).size.height * 0.4,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xff5b5858),
                ),
              ),
            )
          : Text(
              widget.post?.story ?? '',
              style: const TextStyle(
                  fontSize: 17.0,
                  height: 1.5,
                  color: Color(0xff5b5858),
                  fontWeight: FontWeight.bold),
            ),
    );

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () async {
          //toggle favorite state
          if (!widget.isFavorite) {
            await Provider.of<FavoriteStories>(context, listen: false)
                .addFavorite(
                    widget.post?.title ?? '',
                    (widget.post?.id ?? -1).toString(),
                    widget.post?.author ?? '',
                    widget.post?.image ?? '');
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          } else {
            //remove from favorites
            await Provider.of<FavoriteStories>(context, listen: false)
                .deleteFavorite(
              (widget.post?.id ?? -1).toString(),
            );
          }
        },
        child: widget.isFavorite
            ? Icon(
                Icons.favorite,
                color: Color(0xff5b5858),
                size: 50,
              )
            : Icon(
                Icons.favorite_border_outlined,
                color: Color(0xff5b5858),
                size: 50,
              ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Color(0xff5b5858),
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              pinned: true,
              floating: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    widget.post?.title ?? '',
                    style: TextStyle(
                        color: Color(0xff5b5858), fontWeight: FontWeight.bold),
                  ),
                ),
                background: widget.post == null
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Color(0xff5b5858),
                        ),
                      )
                    : AspectRatio(
                        aspectRatio: 1 / 3,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.fitWidth,
                                  alignment: FractionalOffset.topCenter,
                                  image: MemoryImage(
                                      base64Decode(widget.post?.image ?? '')))),
                        ),
                      ),
              ),
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => bottomContent,
                childCount: 1,
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("res/containerBG.png"),
                          fit: BoxFit.cover))),
            )
          ],
        ),
      ),
    );
  }
}
