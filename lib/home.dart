import 'package:flutter/material.dart';
import 'package:sinhala_short_stories/bookmarks.dart';
import 'package:sinhala_short_stories/drawer.dart';
import './posts_model.dart';
import './http_service.dart';
import './post_detail.dart';

class Home extends StatelessWidget {
  final HttpService httpService = HttpService();

  @override
  Widget build(BuildContext context) {
    //app bar
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
            fontFamily: 'sara',
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.orange,
          ),
        ),
        Text(
          'මාවතේ ගීතය',
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

    createTile(Post post) => Hero(
          tag: post.id,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.yellow.shade900,
            child: InkWell(
              onTap: () => Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (context) => PostDetail(post.id),
                ),
              ),
              child: Image(
                image: AssetImage(post.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        );

    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child: Scaffold(
          // backgroundColor: Theme.of(context).primaryColor,
          drawer: MyDrawer(),
          backgroundColor: Colors.transparent,
          appBar: appBar,
          body: FutureBuilder(
            future: httpService.getPosts(),
            builder:
                (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
              if (snapshot.hasData) {
                List<Post> posts = snapshot.data ?? [];

                return Scrollbar(
                  child: CustomScrollView(
                    primary: false,
                    slivers: <Widget>[
                      SliverPadding(
                        padding: const EdgeInsets.all(16.0),
                        sliver: SliverGrid.count(
                          childAspectRatio: 2 / 3,
                          crossAxisCount: 3,
                          mainAxisSpacing: 20.0,
                          crossAxisSpacing: 20.0,
                          children:
                              posts.map((post) => createTile(post)).toList(),
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                      Text(
                        "මදක් රැදීසිටින්න...",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      )
                    ],
                  ),
                  // child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}
