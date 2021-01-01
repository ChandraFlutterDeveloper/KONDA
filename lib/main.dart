import 'package:flutter/material.dart';
import 'package:konda/Screens/Details.dart';
import 'package:konda/Screens/HomeScreen.dart';
import 'package:konda/Screens/More.dart';
import 'package:konda/Screens/Movies.dart';
import 'package:konda/Screens/MyList.dart';
import 'package:konda/Screens/Search.dart';
import 'package:konda/Widgets/Video.dart';

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

    return Scaffold(
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
              icon: Icon(Icons.menu, size: 22, color: Colors.white),
              // ignore: deprecated_member_use
              title: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'More',
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
          More(),
          MyList()
        ],
        onPageChanged: (value){
          setState(() {
            selectedIndex = value;
          });
        }
      )
    );
  }
}
