import 'package:flutter/material.dart';

import 'drawer.dart';

class contact extends StatelessWidget {
  const contact({super.key});

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      iconTheme: IconThemeData(color: Colors.orange.shade500),
      flexibleSpace: const Image(
        image: AssetImage('res/0.jpg'),
        fit: BoxFit.cover,
      ),
      elevation: .5,
      // leading: IconButton(
      //   icon: Icon(Icons.menu),
      //   onPressed:(){}
      // ),
      title: Stack(children: [
        Text(
          'අපට කියන්න',
          style: TextStyle(
            foreground: Paint()
              ..style = PaintingStyle.stroke
              ..strokeWidth = 3
              ..color = Colors.orange,
          ),
        ),
        Text(
          'අපට කියන්න',
          style: TextStyle(color: Colors.grey.shade800),
        ),
      ]),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.search),
          onPressed: () {},
        )
      ],
    );
    return Scaffold(
      drawer: MyDrawer(),
      appBar: appBar,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("res/0.jpg"), fit: BoxFit.cover)),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            children: [
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide:
                        const BorderSide(color: Colors.orange, width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide:
                        const BorderSide(color: Colors.orange, width: 3.0),
                  ),
                  labelText: 'නම',
                  labelStyle: const TextStyle(color: Colors.orange),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 32),
              TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide:
                        const BorderSide(color: Colors.orange, width: 5.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide:
                        const BorderSide(color: Colors.orange, width: 3.0),
                  ),
                  labelText: 'ඔබේ අදහස්',
                  labelStyle: const TextStyle(color: Colors.orange),
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.orange),
                ),
                onPressed: () {},
                child: const Text(
                  'යවන්න',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
