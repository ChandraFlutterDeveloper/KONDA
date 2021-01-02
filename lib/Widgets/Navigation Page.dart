import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';





class NaviagtionPage extends StatefulWidget {
  @override
  _NaviagtionPageState createState() => _NaviagtionPageState();
}

class _NaviagtionPageState extends State<NaviagtionPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Navigation Page"),centerTitle: true,),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.amberAccent,
        ),
      ),
    );
  }
}

