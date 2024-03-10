import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sinhala_short_stories/providers/favorite_story_provider.dart';
import 'package:sinhala_short_stories/tab_screen.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
        value: FavoriteStories(),
        child: MaterialApp(
          title: 'Book App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            platform: TargetPlatform.android,
          ),
          home: TabScreen(),
        ));
  }
}
