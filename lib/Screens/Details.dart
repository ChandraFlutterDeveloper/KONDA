import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konda_app/constants.dart';
import 'package:konda_app/Widgets/Video.dart';
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


          /*<-----------Top image----------->*/

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


                    /*<-----------Mid Row----------->*/


                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text('I Dream...',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Text('2020',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('1 Year',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15)),
                            )),
                        Text('Winter',
                            style:
                                TextStyle(color: Colors.white, fontSize: 15)),
                      ],
                    ),

                    /*<-----------Play Button----------->*/

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


                    /*<-----------Content----------->*/


                    Padding(
                      padding:
                          const EdgeInsets.only(top: 20, left: 30, right: 20, bottom: 20),
                      child: Container(
                          height: 50,
                          child: Text('It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using Content here, content here, making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for lorem ipsum will uncover many web sites still in their infancy.',
                              style: TextStyle(color: Colors.white))),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          height: 50,
                          child: Text('Starring ',
                              style: TextStyle(color: Colors.white))),
                    ),

                    /*<-----------Last Row----------->*/

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

                /*<-----------backgroung image----------->*/

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
                Navigator.pop(context);
              },
            ),
          )
        ]));
  }
}
