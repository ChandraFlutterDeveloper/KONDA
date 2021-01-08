import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:konda_app/Service/ApiService.dart';
import 'dart:convert';
import 'Details.dart';


class Movies extends StatefulWidget {
  @override
  _MoviesState createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {
  Future<List> getData() async {
    final response = await http.get(ApiService.BASE_URL+"Movie_List");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Movies',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   child: Icon(Icons.add),
      // ),
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
