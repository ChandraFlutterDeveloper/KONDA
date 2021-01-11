import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/Movies.dart';
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/Screens/Search.dart';
import 'package:konda_app/constants.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'dart:convert';
import 'package:konda_app/widgets/profile_list_item.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/Screens/Details.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:konda_app/Screens/Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> getMovie() async {
    final response = await http.get(ApiService.BASE_URL + "Movie_List");
    return json.decode(response.body);
  }
  Future<List> popularMovie() async {
    final response = await http.get(ApiService.BASE_URL + "Popular_Movie_List");
    return json.decode(response.body);
  }
  Future<List> getSlider() async {
    final response = await http.get(ApiService.BASE_URL + "Slider_List");
    return json.decode(response.body);
  }


  int currentIndex = 0;
  String selectedIndex = 'TAB: 0';

  String email = "", name = "", id = "";
  TabController tabController;

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(5),
                alignment: Alignment.center,
                constraints: BoxConstraints.expand(height: 225),
                child: imageSlider(context)),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 284.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20.0, right: 130.0, left: 10.0),
                    child: Text('Come enjoy with us..',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      child: FutureBuilder<List>(
                        future: getMovie(),

                        // ignore: missing_return
                        builder: (ctx, ss) {
                          if (ss.hasError) {
                            print('error');
                          }
                          if (ss.hasData) {
                            return Items(list: ss.data);
                          } else {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 261.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 200.0),
                    child: Text('Popular Shows',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 20.0),
                      height: 200,
                      child: FutureBuilder<List>(
                        future: popularMovie(),

                        // ignore: missing_return
                        builder: (ctx, ss) {
                          if (ss.hasError) {
                            print('error');
                          }
                          if (ss.hasData) {
                            return Items(list: ss.data);
                          } else {
                            return Center(
                              child: const CircularProgressIndicator(),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Swiper imageSlider(context) {
    return new Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://konda.co.in/userAssets/img/covers/cover3.jpg",
            height: 124.0, width: 100.0, fit: BoxFit.cover,
        );
      },
      itemCount: 10,
      viewportFraction: 0.7,
      scale: 0.8,
    );
  }

  //  Action on Bottom Bar Press
  void reds(selectedIndex) {
//    print(selectedIndex);

    switch (selectedIndex) {
      case "TAB: 0":
        {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
        }

        break;

      case "TAB: 1":
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Movies()));
        }
        break;

      case "TAB: 2":
        {
          Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
        }
        break;
    }
  }
}

class Items extends StatelessWidget {
  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
                splashColor: Colors.blue.withAlpha(30),
                onTap: () {
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) => Details()));
                },
                child: Container(
                  width: 100,
                  child: Column(children: [
                    Image.network(ApiService.BASE_URL + list[i]['v_poster'],
                        height: 124.0, width: 100.0, fit: BoxFit.cover),
                    LinearProgressIndicator(value: 50.0),
                    Row(
                      children: <Widget>[
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.info_outlined,
                              size: 22.0,
                              color: Colors.white,
                            )),
                        IconButton(
                            onPressed: null,
                            icon: Icon(
                              Icons.more_vert_sharp,
                              size: 22.0,
                              color: Colors.white,
                            )),
                      ],
                    )
                  ]),
                )),
          ),
        );
      },
    );
  }
}
