import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinhala_short_stories/drawer.dart';
import 'package:sinhala_short_stories/post_detail.dart';
import 'package:sinhala_short_stories/providers/favorite_story_provider.dart';

class FavoriteScreen extends StatelessWidget {
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
        'ප්‍රියතම කතා',
        style: TextStyle(
          fontFamily: 'sara',
          foreground: Paint()
            ..style = PaintingStyle.stroke
            ..strokeWidth = 3
            ..color = Colors.orange,
        ),
      ),
      Text(
        'ප්‍රියතම කතා',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      drawer: MyDrawer(),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child: FutureBuilder(
            future: Provider.of<FavoriteStories>(context, listen: false)
                .fetchFavorites(),
            builder: (ctx, snapshot) => snapshot.connectionState ==
                    ConnectionState.waiting
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : Consumer<FavoriteStories>(
                    child: const Center(
                      child: Text(
                        'ප්‍රියතම කතා නොමැත',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    builder: (context, story, ch) => story
                            .getFavoriteStorie.isEmpty
                        ? const SizedBox.shrink()
                        : ListView.builder(
                            itemBuilder: (ctx, i) => GestureDetector(
                              onTap: () {
                                Navigator.of(context, rootNavigator: true).push(
                                  MaterialPageRoute(
                                    builder: (
                                      context,
                                    ) =>
                                        PostDetail(int.parse(
                                            story.getFavoriteStorie[i].id)),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 4,
                                child: ListTile(
                                  leading: const Icon(Icons.bookmark),
                                  subtitle:
                                      Text(story.getFavoriteStorie[i].author),
                                  title: Text(story.getFavoriteStorie[i].title),
                               
                                  trailing: Wrap(
                                    spacing: 12, // space between two icons
                                    children: <Widget>[
                                      GestureDetector(
                                          child: const Icon(Icons.delete),
                                      
                                          onTap: () => showDialog<String>(
                                                context: context,
                                                builder:
                                                    (BuildContext context) =>
                                                        AlertDialog(
                                                  title: const Text(
                                                      'ඉවත් කිරීම තහවුරු කරන්න'),
                                                  content: const Text(
                                                      'ප්‍රියතම ලැයිස්තුවෙන් ඉවත් කරන්න?'),
                                                  actions: <Widget>[
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(context,
                                                              'Cancel'),
                                                      child: const Text('නෑ'),
                                                    ),
                                                    TextButton(
                                                      onPressed: () async {
                                                        await Provider.of<
                                                                    FavoriteStories>(
                                                                context,
                                                                listen: false)
                                                            .deleteFavorite(story
                                                                .getFavoriteStorie[
                                                                    i]
                                                                .id);
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      child: const Text('ඔව්'),
                                                    ),
                                                  ],
                                                ),
                                              )), // icon-1
                                      GestureDetector(
                                        child: const Icon(
                                            Icons.arrow_forward_ios_sharp),
                                        onTap: () {},
                                      ), // icon-2
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            itemCount: story.getFavoriteStorie.length,
                          ),
                  )),
      ),
    );
  }
}
