import 'package:flutter/material.dart';
import 'package:sinhala_short_stories/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bookmarks extends StatelessWidget {
  String postid = '';

  @override
  void initState() {
    getBookmarks();
  }

  getBookmarks() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState() {
      postid = prefs.getString('postid') ?? '';
      print("post id getting" + postid);
    }
  }

  display() {
    if (postid != '') {
      print("inside getting");
      return Text(postid.toString());
    } else {
      return const Text("not getting");
    }
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed:(){}
      // ),
      title: const Text('සුරැකුම්'),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
    return Scaffold(
      drawer: MyDrawer(),
      appBar: appBar,
      body: Center(child: display()),
    );
  }
}
