import 'package:flutter/material.dart';
enum Menu { location, add_widget }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".



  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final String title = 'Better Weather';
  String route = '';


  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          // This button presents popup menu items.
          PopupMenuButton<Menu>(
            // Callback that sets the selected popup menu item.
              icon: const Icon(Icons.menu),
              onSelected: (Menu item) {
                route = item.name;
                Navigator.pushNamed(context, '/$route');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
                const PopupMenuItem<Menu>(
                  value: Menu.location,
                  child: Text('Location'),
                ),
                const PopupMenuItem<Menu>(
                  value: Menu.add_widget,
                  child: Text('Add Widget'),
                ),
              ]),
        ],
        title: const Text("Better Weather"),
      ),
      body: const Center(
      ),
    );
  }
}
//https://api.flutter.dev/flutter/material/PopupMenuButton-class.html

