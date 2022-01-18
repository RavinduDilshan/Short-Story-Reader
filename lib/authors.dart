import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensor_app/drawer.dart';

class authors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.orange.shade500),
      flexibleSpace: Image(
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
          'ලේඛක මඩුල්ල',
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.orange[400],
          ),
        ),
        Text(
          'ලේඛක මඩුල්ල',
          style: TextStyle(color: Colors.grey.shade800),
        ),
      ]),
      // actions: <Widget>[
      //   IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {},
      //   )
      // ],
    );

    return Scaffold(
      appBar: appBar,
      drawer: MyDrawer(),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Stack(
                  children: [
                    Ink.image(
                      image: AssetImage('res/lahiru.jpeg'),
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        "ලහිරු සම්පත් කරුණාරත්න",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      right: 16,
                      left: 16,
                      child: Text(
                        "lahiru.s.karunarathna@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Container(
              width: double.infinity,
              child: Card(
                elevation: 10,
                child: Stack(
                  children: [
                    Ink.image(
                      image: AssetImage('res/shammi.jpg'),
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Positioned(
                      bottom: 16,
                      right: 16,
                      left: 16,
                      child: Text(
                        "ශම්මි මධුමාධව ඡයතිලක",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                      ),
                    ),
                    Positioned(
                      bottom: 3,
                      right: 16,
                      left: 16,
                      child: Text(
                        "shammijayathilaka96@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
