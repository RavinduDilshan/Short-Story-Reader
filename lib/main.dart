import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sensor_app/tab_screen.dart';
import './home.dart';
import 'bookmarks.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Book App',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        accentColor: Colors.deepOrange,
        platform: TargetPlatform.android,
      ),
      home: TabScreen(),
    );
  }
}
