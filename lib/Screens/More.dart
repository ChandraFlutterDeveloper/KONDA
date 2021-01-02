import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class More extends StatefulWidget {
  @override
  _MoreState createState() => _MoreState();
}

class _MoreState extends State<More> {
  Future<List> getData() async {
    final response = await http.get("https://konda.co.in/Movie_List");
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
