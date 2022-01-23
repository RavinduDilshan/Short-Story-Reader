import 'package:flutter/cupertino.dart';
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
  final List<Widget> _pages = [Home(), FavoriteScreen()];

  var _pageSelected = 0;

  void _selectPage(int index) {
    setState(() {
      _pageSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      // body: _pageSelected == 0 ? Home() : FavoriteScreen(),
      tabBar: CupertinoTabBar(
        items: [
          BottomNavigationBarItem(
            title: Text('සියලුම කතා', style: TextStyle(fontSize: 12.0)),
            icon: Icon(Icons.book),
          ),
          BottomNavigationBarItem(
            title: Text('ප්‍රියතම කතා', style: TextStyle(fontSize: 12.0)),
            icon: Icon(Icons.star),
          ),
        ],
        activeColor: Colors.orange,
        currentIndex: _pageSelected,
        onTap: (ind) {
          setState(() {
            _pageSelected = ind;
          });
        },
      ),
      tabBuilder: (context, i) {
        return CupertinoTabView(builder: (context) {
          return _pages[i];
        });
      },
      // BottomNavigationBar(

      //     // selectedItemColor: Colors.grey,
      //     // unselectedItemColor: Colors.white,
      //     currentIndex: _pageSelected,
      //     type: BottomNavigationBarType.shifting,
      //     onTap: _selectPage,
      //     items: [
      //       BottomNavigationBarItem(
      //           backgroundColor: Colors.grey,
      //           icon: Icon(
      //             Icons.book,
      //             color: Colors.white,
      //           ),
      //           title: Text(
      //             'සියලුම කතා',
      //             style: TextStyle(color: Colors.white),
      //           )),
      //       BottomNavigationBarItem(
      //           backgroundColor: Colors.grey,
      //           icon: Icon(
      //             Icons.star,
      //             color: Colors.white,
      //           ),
      //           title: Text(
      //             'ප්‍රියතම කතා',
      //             style: TextStyle(color: Colors.white),
      //           ))
      //     ]),
    );
  }
}
