import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List> getData() async {
    final response = await http.get("https://konda.co.in/Movie_List");
    return json.decode(response.body);
  }

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
