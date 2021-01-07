import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/HomeScreen.dart';
import 'dart:convert';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konda_app/constants.dart';
import 'package:konda_app/Widgets/Video.dart';

<<<<<<< Updated upstream
import 'package:konda_app/Service/ApiService.dart';

=======
<<<<<<< HEAD

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:konda_app/Service/ApiService.dart';

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
            home: Details(),
          );
        },
      ),
    );
  }
}
=======
import 'package:konda_app/Service/ApiService.dart';

>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Future<List> getData() async {
    final response = await http.get(ApiService.BASE_URL+"Movie_List");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250,
                      width: 150,
                      child: Image.network('https://konda.co.in/userAssets/img/covers/cover.jpg'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('about show',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Text('year',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('age',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )),
                        Text('season',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right:25,left:25,top: 8.0),
                      child: Container(
                        height: 35,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: FlatButton.icon(
                            onPressed: ()=>
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => Videoplayer())),
                            icon: Icon(Icons.play_arrow_outlined,
                                size: 30, color: Colors.black),
                            label: Text('Play',
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16))),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 8, right: 8),
                      child: Container(
                          height: 50,
                          child: Text('Info of movie',
                              style: TextStyle(color: Colors.white))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          child: Text('Starring ',
                              style: TextStyle(color: Colors.white))),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        MaterialButton(
                          onPressed: null,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.add, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'My List',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: null,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.thumb_up_alt_outlined,
                                  color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Rate',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                        MaterialButton(
                          onPressed: null,
                          child: Column(
                            children: <Widget>[
                              Icon(Icons.share, color: Colors.white),
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  'Share',
                                  style: TextStyle(color: Colors.white),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.grey.shade500,
                    )
                  ],
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(

                        image: NetworkImage('https://konda.co.in/userAssets/img/covers/cover2.jpg',),
                        fit: BoxFit.cover,

                        colorFilter: ColorFilter.mode(
                            Colors.black54, BlendMode.darken))),
              ),
            ),
            expandedHeight: 790,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeScreen()));
              },
            ),
          )
        ]));
  }
}
