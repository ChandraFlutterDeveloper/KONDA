import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: Icon(Icons.search, color: Colors.grey),
        title: TextField(
          decoration: InputDecoration(
            hintText: 'Search for movies, shows, genre, etc.',
            helperStyle: TextStyle(color: Colors.white),
            suffixIcon: IconButton(
              onPressed: null,
              icon: Icon(Icons.mic, color: Colors.grey),
            ),
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              'Popular Searches',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 400,
            )
          ],
        ),
      ),
    );
  }
}
