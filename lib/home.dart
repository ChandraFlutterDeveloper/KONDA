import 'package:flutter/material.dart';
import 'package:konda_app/Screens/Details.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
import 'package:konda_app/Screens/More.dart';
import 'package:konda_app/Screens/Movies.dart';
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/Screens/Profile.dart';
import 'package:konda_app/Screens/Search.dart';
import 'package:konda_app/widgets/Video.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Konda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {


  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: roundedButton("No", const Color(0xffff5722),
                const Color(0xFFFFFFFF)),
          ),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: roundedButton(" Yes ", const Color(0xFF00E606),
                const Color(0xFFFFFFFF)),
          ),
        ],
      ),
    ) ??
        false;
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    PageController pageController = PageController();
    void onTap(int pageValue) {
      setState(() {
        selectedIndex = pageValue;
      });
      pageController.jumpToPage(pageValue);
    }
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          backgroundColor: Colors.black,
          bottomNavigationBar: new BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          selectedFontSize: 14,
          selectedIconTheme: IconThemeData(color: Colors.black87),
          unselectedFontSize: 12,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home, size: 22, color: Colors.white),
                // ignore: deprecated_member_use
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Home',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.search, size: 22, color: Colors.white),
                // ignore: deprecated_member_use
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.movie, size: 22, color: Colors.white),
                // ignore: deprecated_member_use
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Movies',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.person, size: 22, color: Colors.white),
                // ignore: deprecated_member_use
                title: Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Profile',
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                )),
              ],
              onTap: onTap,
            ),
            body:PageView(
              controller: pageController,
              children: [
                HomeScreen(),
                Search(),
                Movies(),
                ProfileScreen(),

            ],
            onPageChanged: (value){
              setState(() {
                selectedIndex = value;
              });
            }
          )
        )
    );
  }
}
