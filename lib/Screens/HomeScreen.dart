import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda/Home.dart';
import 'dart:convert';

import 'package:konda/Screens/MyList.dart';
import 'package:konda/Screens/login_page.dart';
import 'package:konda/Screens/registration.dart';
import 'package:konda/Service/UserService.dart';
import 'package:konda/Widgets/Navigation%20Page.dart';

import 'More.dart';
import 'Movies.dart';
import 'Profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> getData() async {
    final response = await http.get("https://konda.co.in/Movie_List");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            new Container(
              color: Colors.black,
              child: Column(
                children: <Widget>[
                  Center(
                      child: Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  )),
                  Text(
                    "Email",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                  Text(
                    "User",
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 12),
                  ),
                ],
              ),
            ),
            Divider(
              color: Colors.black,
              thickness: 3.0,
            ),
            ListTile(
              title: Text("Home",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage()),
                );
              },
            ),
            ListTile(
                title: Text("Movies",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Movies()));
                }),
            ListTile(
                title: Text(
                  "Profile",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profile()));
                }),
            ListTile(
                title: Text(
                  "My List",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyList()));
                }),

            ListTile(
                title: Text(
                  "Sign-In",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
            ListTile(
                title: Text(
                  "Sign-Up",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Register()));
                }),
            ListTile(
                title: Text(
                  "Sign-Out",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                }),
          ],
        ),
      ),
      appBar: new AppBar(
        backgroundColor: Colors.black87,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 3.0),
            child: MaterialButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyList()));
                },
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      size: 20.0,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text('My List',
                          style:
                              TextStyle(color: Colors.white, fontSize: 15.0)),
                    ),
                  ],
                )),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 250.0,
              child: Image.network(MovieService.BASE_URL + 'v_poster'),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MaterialButton(
                    onPressed: null,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add, size: 20.0, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('My List',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(
                        Icons.play_circle_outline_outlined,
                        size: 20.0,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Play',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: null,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.info_outline,
                            size: 20.0, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Info',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 18.0)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 270.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, right: 150.0),
                    child: Text('Come enjoy with us..',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 100.0,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 150.0,
                                  width: 150.0,
                                  child: Image.asset('assets/images/img5.jpg'),
                                ),
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
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0),
                          child: SizedBox(
                            width: 100.0,
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 150.0,
                                  width: 150.0,
                                  child: Image.asset('assets/images/img6.jpg'),
                                ),
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
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200.0,
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
                  SizedBox(
                    height: 170,
                    child: FutureBuilder<List>(
                      future: getData(),
                      builder: (ctx, ss) {
                        if (ss.connectionState == ConnectionState.waiting) {
                          return ListView.builder(
                            itemCount: ss.data.length,
                            itemBuilder: (_, index) {
                              return SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.asset(ss.data[index]
                                    .data[MovieService.BASE_URL + 'v_poster']),
                              );
                            },
                          );
                        } else {
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: ss.data.length,
                            itemBuilder: (_, index) {
                              return SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(ss.data[index]
                                    .data[MovieService.BASE_URL + 'v_poster']),
                              );
                            },
                          );
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 200.0,
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 250.0),
                    child: Text('Animation',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class DrawerPage extends StatefulWidget {
  @override
  _DrawerState createState() => _DrawerState();
}

class _DrawerState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.cyanAccent,
            child: Column(
              children: <Widget>[
                Center(
                    child: Icon(
                  Icons.account_circle,
                  size: 100,
                  color: Colors.red,
                )),
                Text("Email"),
                Text("User Name"),
              ],
            ),
          ),
          Divider(
            color: Colors.black,
            thickness: 3.0,
          ),
          ListTile(
            title: Text("NavigationPage"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NaviagtionPage()),
              );
            },
          ),
          ListTile(
              title: Text("More"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => More()),
                );
              }),
          ListTile(
              title: Text("Movies"),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Movies()),
                );
              })
        ],
      ),
    );
  }
}
