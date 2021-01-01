import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.black87,
            leading: Image.asset(
              'assets/icons/konda1.png',
              scale: 15.0,
              color: Colors.white,
            ),
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: MaterialButton(
                    onPressed: () {},
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
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0)),
                        ),
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: MaterialButton(
                    onPressed: () {},
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.account_circle_outlined,
                            size: 20.0, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text('Profile',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 15.0)),
                        ),
                      ],
                    )
                    // Text('Movies',
                    //     style: TextStyle(color: Colors.white, fontSize: 18.0)),
                    ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 250.0,
              child: Image.asset('assets/images/img7.jpg'),
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
