import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sensor_app/drawer.dart';

class authors extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: .5,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed:(){}
      // ),
      title: Text('ලේඛක මඩුල්ල'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );

    return Scaffold(
        appBar: appBar,
        drawer: MyDrawer(),
        body: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Container(
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
                        "ලහිරු සම්පත් කරුනාරත්න",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 24),
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
            Container(
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
                            fontSize: 24),
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
          ]),
        ));
  }
}
