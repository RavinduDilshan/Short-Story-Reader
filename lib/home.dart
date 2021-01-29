
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
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed:(){}
      // ),
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






     return
     Container(
         decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
     child:Scaffold(



      // backgroundColor: Theme.of(context).primaryColor,
      backgroundColor: Colors.transparent,
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
            return Center(
                child: Column(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                     CircularProgressIndicator(),
                     Text("මදක් රැදීසිටින්න...",
                      style: TextStyle(
                            fontSize:20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
  ),
                     )
                  ],

                ),
              // child: CircularProgressIndicator(),

              );
          }
        },
      ),
       drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('මාවතේ ගීතය'),
              decoration: BoxDecoration(
                image: DecorationImage(
                image: AssetImage("res/drawer_img.jpg"), fit: BoxFit.cover)
              ),
            ),
            ListTile(
               leading: Icon(Icons.home),
              title: Text('Home',
              style: TextStyle(
                fontSize: 20
              ),


              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.bookmark),
              title: Text('Bookmarks',
                style: TextStyle(
                fontSize: 20
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.person),
              title: Text('Authors',
                style: TextStyle(
                  fontSize: 20
                ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.swap_vertical_circle),
              title: Text('Visit Web',
              style: TextStyle(
                fontSize: 20
              ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
              ListTile(
              leading: Icon(Icons.share),
              title: Text('Invite Friends',
              style: TextStyle(
                fontSize: 20
              ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.message),
              title: Text('Contact Us',
              style: TextStyle(
                fontSize: 20
              ),

              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
             ListTile(
              leading: Icon(Icons.code),
              title: Text('About Developer',
              style: TextStyle(
                fontSize: 20
              ),
              ),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),


    )
     );
  }
}