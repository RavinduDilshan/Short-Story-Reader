import 'package:flutter/material.dart';
import 'package:sensor_app/drawer.dart';
import 'package:sensor_app/favorite_screen.dart';
import 'package:sensor_app/home.dart';

import 'package:provider/provider.dart';
import 'package:sensor_app/providers/favorite_story_provider.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  var _pageSelected = 0;

  void _selectPage(int index) {
    setState(() {
      _pageSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageSelected == 0
          ? Home()
          : ChangeNotifierProvider.value(
              value: FavoriteStories(), child: FavoriteScreen()),
      bottomNavigationBar: BottomNavigationBar(
          // selectedItemColor: Colors.grey,
          // unselectedItemColor: Colors.white,
          currentIndex: _pageSelected,
          type: BottomNavigationBarType.shifting,
          backgroundColor: Colors.orange[400],
          onTap: _selectPage,
          items: [
            BottomNavigationBarItem(
                backgroundColor: Colors.grey,
                icon: Icon(
                  Icons.book,
                  color: Colors.white,
                ),
                title: Text(
                  'සියලුම කතා',
                  style: TextStyle(color: Colors.white),
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.star,
                  color: Colors.white,
                ),
                title: Text(
                  'ප්‍රියතම කතා',
                  style: TextStyle(color: Colors.white),
                ))
          ]),
    );
  }
}
