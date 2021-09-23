import 'package:flutter/material.dart';
import 'package:sensor_app/bookmarks.dart';
import 'package:sensor_app/drawer.dart';
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
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    createTile(Post post) => Hero(
          tag: post.id,
          child: Material(
            elevation: 15.0,
            shadowColor: Colors.yellow.shade900,
            child: InkWell(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PostDetail(
                    post: post,
                  ),
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
        decoration: BoxDecoration(
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
                List<Post> posts = snapshot.data;
                return CustomScrollView(
                  primary: false,
                  slivers: <Widget>[
                    SliverPadding(
                      padding: EdgeInsets.all(16.0),
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
                );
              } else {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
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
