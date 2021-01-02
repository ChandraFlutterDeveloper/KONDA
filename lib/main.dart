import 'dart:async';
import 'package:flutter/material.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:konda/Screens/HomeScreen.dart';
import 'package:konda/Screens/Movies.dart';

import 'package:shared_preferences/shared_preferences.dart';


import 'Screens/introSlider.dart';

void main() {


    runApp(new MyApp());

}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Movies(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>

    with SingleTickerProviderStateMixin {
//----------------------------------------------------------------------------------------------//
  void handleTimeout() async {

      Navigator.push( context,  MaterialPageRoute(builder: (context)=>IntroScreen()));

  }
//----------------------------------------------------------------------------------------------//
  startTimeout() async {
    var duration = const Duration(seconds: 3);
    return new Timer(duration, handleTimeout);
  }
//----------------------------------------------------------------------------------------------//
  @override
  void initState() {
    super.initState();
    startTimeout();
  }
//----------------------------------------------------------------------------------------------//

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset("assets/logo.png", height: 100.0,),

          SizedBox(height: 30.0,),

          SpinKitThreeBounce(color: Colors.orange),
        ],
      ),
    );

  }

}