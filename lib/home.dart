
import 'package:flutter/material.dart';
import './posts_model.dart';
import './http_service.dart';
import './post_detail.dart';




class Home extends StatelessWidget {
   final HttpService httpService = HttpService();
  @override
  Widget build(BuildContext context) {
    //app bar
    final appBar = AppBar(
      elevation: .5,
      leading: IconButton(
        icon: Icon(Icons.menu),
        onPressed:(){}
      ),
      title: Text('මාවතේ ගීතය'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: (){},
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


    



     return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: appBar,
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post> posts = snapshot.data;
            return  CustomScrollView(
      primary: false,
      slivers: <Widget>[
        SliverPadding(
          padding: EdgeInsets.all(16.0),
          sliver: SliverGrid.count(
            childAspectRatio: 2 / 3,
            crossAxisCount: 3,
            mainAxisSpacing: 20.0,
            crossAxisSpacing: 20.0,
            children: posts.map((post) => createTile(post)).toList(),




          ),
        )
      ],
    );
           
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}