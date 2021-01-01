import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:konda/main.dart';

class Details extends StatefulWidget {
  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: CustomScrollView(slivers: <Widget>[
          SliverAppBar(
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 250,
                      width: 150,
                      child: Image.asset('assets/images/img5.jpg'),
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
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: 35,
                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)),
                        child: FlatButton.icon(
                            onPressed: null,
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
                        image: AssetImage('assets/images/img5.jpg'),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                            Colors.black54, BlendMode.darken))),
              ),
            ),
            expandedHeight: 590,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Homepage()));
              },
            ),
          )
        ]
        )
    );
  }
}

