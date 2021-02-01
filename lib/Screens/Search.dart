/*import 'package:flutter/material.dart';
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
              builder: (ctx, ss) {
                if (ss.hasError) {
                  print('error');
                }
                if (ss.hasData) {
                  return SearchItem(list: ss.data);
                } else {
                  return Center(
                    child: const CircularProgressIndicator(),
                  );
                }
              },
              // ignore: missing_return

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

class SearchItem extends StatelessWidget {
  List list;
  SearchItem({this.list});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list == null ? 0 : list.length,
        shrinkWrap: true,
        itemBuilder: (ctx, i) {
          return Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(list[i]['v_title'], style: TextStyle(fontSize: 20,color: Colors.blue),),
                    Text(list[i]['v_descr'], style: TextStyle(fontSize: 15),),
                  ],
                ),
              );

        });
  }
}



class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Widget> _pages = [];
  var _isInit = true;
  var _isLoading = false;

  int _selectedPageIndex = 0;
  bool _isSearching = false;
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Provider.of<Auth>(context).tryAutoLogin().then((_) {});
  }



  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _handleSubmitted(String value) {
    final searchText = searchController.text;
    if (searchText.isEmpty) {
      return;
    }

    searchController.clear();
    Navigator.of(context).pushNamed(
      ApiService.BASE_URL+"Search_List",
      arguments: {
        'category_id': null,
        'seacrh_query': searchText,
        'type': ApiService.BASE_URL+"Search_List",
      },
    );
    // print(searchText);
  }

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !_isSearching
            ? Image.asset(
          'assets/images/logo.png',
          fit: BoxFit.contain,
          height: 32,
        )
            : TextFormField(
          decoration: InputDecoration(
            labelText: 'Search Here',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          controller: searchController,
          onFieldSubmitted: _handleSubmitted,
        ),

        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              }),
        ],
      ),


    );
  }
}*/

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

  String movies, usrSearch= '';
  final _key = new GlobalKey<FormState>();
  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      search();
    }
  }

  search() async {
    final response = await http
        .post(ApiService.BASE_URL+"SearchMovies", body: {
      "movies": movies,
    });
    final data = jsonDecode(response.body);
  }
  Future<List> get_movies() async {
    final response = await http.get(ApiService.BASE_URL + "GetMovies");
    return jsonDecode(response.body);
  }

  Future search_movies() async {
    print("search: "+usrSearch);
    final response = await http.post(ApiService.BASE_URL + "SearchMovies", body: {
      "search" : usrSearch,
    });
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

 /* Future<void> Movies(String searchQuery) async {
    var url =await ApiService.BASE_URL+"SearchMovies" + '/$searchQuery';
    print(url);
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as List;
      if (extractedData == null) {
        return;
      }
      // print(extractedData);


    } catch (error) {
      throw (error);
    }
  }*/

  int _selectedPageIndex = 0;
  bool _isSearching = false;
  final searchController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: DarkSecondaryColor,
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: !_isSearching
            ? Image.asset(
          'assets/images/logos.png',
          fit: BoxFit.contain,
          height: 32,
        )
            : TextFormField(
              onChanged: (value) {
                usrSearch = value;

              },
          decoration: InputDecoration(
            labelText: 'Search Here',
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),


          controller: searchController,
          // onFieldSubmitted: _handleSubmitted,
        ),

        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  _isSearching = !_isSearching;
                });
              }),
        ],
      ),


      body: FutureBuilder<List>(

        future: search_movies(),

        // ignore: missing_return
        builder: (ctx, ss) {
          if (ss.hasError) {
            print('error');
            print(ss.error);
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

/*Widget buildTextField(String hintText) {
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
}*/

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
