import 'package:flutter/material.dart';
import 'package:sensor_app/authors.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'bookmarks.dart';
import 'contact.dart';
import 'home.dart';

class MyDrawer extends StatelessWidget {
  _launchURL() async {
    const url = 'http://mawathegeethaya.blogspot.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("res/drawer_img.jpg"),
                    fit: BoxFit.cover)),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text(
              'ප්‍රධාන පිටුව',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Home(),
                ),
              );
            },
          ),
          // ListTile(
          //   leading: Icon(Icons.bookmark),
          //   title: Text(
          //     'සුරැකුම්',
          //     style: TextStyle(fontSize: 20),
          //   ),
          //   onTap: () {
          //     // Update the state of the app
          //     // ...
          //     // Then close the drawer
          //     // Navigator.pop(context);
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => Bookmarks(),
          //       ),
          //     );
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text(
              'ලේඛක මඩුල්ල',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              // Update the state of the app
              // ...
              // Then close the drawer
              // Navigator.pop(context);
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => authors(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.swap_vertical_circle),
            title: Text(
              'වෙබ් පිටුව',
              style: TextStyle(fontSize: 20),
            ),
            onTap: _launchURL,
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text(
              'යාලුවන්ට කියන්න',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Share.share(
                  'මාවතේ ගීතය ඇප් එක ඩවුන්ලෝඩ් කරගන්න ක්ලික් කරන්න - https://example.com');
            },
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text(
              'අපට කියන්න',
              style: TextStyle(fontSize: 20),
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => contact(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text(
              'About Developer',
              style: TextStyle(fontSize: 20),
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
    );
  }
}
