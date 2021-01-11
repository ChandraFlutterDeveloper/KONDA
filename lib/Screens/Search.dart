import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/Details.dart';
import 'dart:convert';

import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/constants.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  Future<List> getData() async {
    final response = await http.get(ApiService.BASE_URL+"Search_List");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: DarkSecondaryColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: buildTextField('Search for movies, shows, genre, etc.'),
      ),
      body: FutureBuilder<List>(
              future: getData(),

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
    );
  }
}

Widget buildTextField(String hintText) {
  return TextField(
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(
        color: Colors.grey,
        fontSize: 16.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      prefixIcon: hintText == 'Search for movies, shows, genre, etc.'
          ? Icon(Icons.search)
          : Icon(Icons.youtube_searched_for_rounded),

    ),
  );
}

class Items extends StatelessWidget {
  List list;
  Items({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        itemBuilder: (ctx, i) {
          return ListTile(
              leading: Image.network(ApiService.BASE_URL+list[i]['v_poster']),
              title: Text(list[i]['v_title']),
              subtitle: Text(list[i]['year']),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Details()));
              });
        });
  }
}
