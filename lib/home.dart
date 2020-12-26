import 'package:flutter/material.dart';
import 'package:flutter_konda/Movies.dart';
import 'package:flutter_konda/MyList.dart';
import 'package:flutter_konda/TvShows.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  int navigationIndex = 0;
  GlobalKey globalKey = new GlobalKey(debugLabel: 'btm_app_bar');
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;


  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: new Text('Welcome'),
        backgroundColor: Colors.grey,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.movie_outlined,color: Colors.white, size: 20.0,),

            onPressed: () {
              Navigator.push(
                  context,  MaterialPageRoute(builder: (context)=>Movies()));
            },
          ),

          IconButton(
            icon: Icon(Icons.library_add,color: Colors.white, size: 20.0),

            onPressed: () {
              Navigator.push(
                  context,  MaterialPageRoute(builder: (context)=>MyList()));
            },
          ),
          IconButton(
            icon: Icon(Icons.live_tv,color: Colors.white, size: 20.0),
            onPressed: () {
              Navigator.push(
                  context,  MaterialPageRoute(builder: (context)=>TvShows()));
            },
          )
        ],
      ),


      backgroundColor: Colors.black,
      bottomNavigationBar: new BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.home),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 0
                      ? null
                      : () => Navigator.push(
                      context,  MaterialPageRoute(builder: (context)=>Home()))),
              IconButton(
                  icon: Icon(Icons.search),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 1
                      ? null
                      : () => setState(() => _currentIndex = 1)),
              IconButton(
                  icon: Icon(Icons.settings),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 2
                      ? null
                      : () => setState(() => _currentIndex = 2)),
              IconButton(
                  icon: Icon(Icons.download_outlined),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 3
                      ? null
                      : () => setState(() => _currentIndex = 3)),
              IconButton(
                  icon: Icon(Icons.more_vert_sharp),
                  disabledColor: Colors.green,
                  onPressed: _currentIndex == 4
                      ? null
                      : () => setState(() => _currentIndex = 4)),
            ],
          )
      ),//bottomAppBar

      body: CustomScrollView(
        slivers: <Widget>[

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
                    color: Colors.white,
                    onPressed: null,
                    child: Column(
                      children: <Widget>[
                        Icon(Icons.add, color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('My List',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0)),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)),
                    child: FlatButton.icon(
                      onPressed: null,
                      icon: Icon(Icons.play_circle_filled),
                      label: Text(
                        'Play',
                        style: TextStyle(color: Colors.black, fontSize: 12.0),
                      ),
                    ),
                  ),
                  MaterialButton(
                    onPressed: null,
                    color: Colors.white,

                    child: Column(
                      children: <Widget>[
                        Icon(Icons.info_outline,color: Colors.white),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text('Info',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0)),
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
                                        icon:Icon(Icons.info_outline, color: Colors.white),

                                          ),
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.more_vert_rounded, color: Colors.white,),

                                    ),
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
                                        icon:Icon(Icons.info_outline, color: Colors.white)),
                                    IconButton(
                                        onPressed: null,
                                        icon: Icon(Icons.more_vert_rounded, color: Colors.white)),
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
          )
        ],
      ),
    );
  }
}



