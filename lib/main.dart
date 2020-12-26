import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_konda/introSlider.dart';
import 'package:flutter_konda/login_page.dart';
import 'package:flutter_konda/welcome.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/services.dart';
import 'package:flutter_konda/home.dart';


void main() {
  runApp(MyApp());
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
  void initState() {

    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    Timer(Duration(seconds: 0), ()=>Navigator.push(
        context,  MaterialPageRoute(builder: (context)=>LoginPage())));
  }

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
