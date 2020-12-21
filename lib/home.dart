import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: new Image.asset('icons/home.png',scale: 22.0,color: Colors.white),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Home', style: TextStyle(color: Colors.white, fontSize: 12.0)),
              )
          ),
          BottomNavigationBarItem(
              icon: new Image.asset('icons/zoom.png',scale: 22.0,color: Colors.white),
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Search', style: TextStyle(color: Colors.white, fontSize: 12.0)),
              )
          )
        ],
      ),
    );
  }
}
