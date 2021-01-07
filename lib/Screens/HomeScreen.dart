import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
import 'dart:convert';
import 'package:konda_app/widgets/profile_list_item.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/constants.dart';
import 'package:konda_app/Screens/Details.dart';

<<<<<<< Updated upstream
=======
<<<<<<< HEAD
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

=======
>>>>>>> Stashed changes
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/Screens/Search.dart';
import 'package:konda_app/Screens/login_page.dart';
import 'package:konda_app/Screens/registration.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/constants.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Movies.dart';
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
import 'Profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(
<<<<<<< Updated upstream

=======
<<<<<<< HEAD
=======

>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: HomeScreen(),
          );
        },
      ),
    );
  }
}
<<<<<<< Updated upstream
=======
<<<<<<< HEAD

=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<List> getData() async {
<<<<<<< Updated upstream
    final response = await http.get(ApiService.BASE_URL+"Movie_List");
=======
<<<<<<< HEAD
    final response = await http.get(ApiService.BASE_URL + "Movie_List");
=======
    final response = await http.get(ApiService.BASE_URL+"Movie_List");
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
    return json.decode(response.body);
  }

  Future<bool> _onBackPressed() {
    return showDialog(
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
          context: context,
          builder: (context) => new AlertDialog(
            title: new Text('Are you sure?'),
            content: new Text('Do you want to exit an App'),
            actions: <Widget>[
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(false),
                child: roundedButton(
                    "No", Color(0xFF212121), const Color(0xFFFFFFFF)),
              ),
              new GestureDetector(
                onTap: () => Navigator.of(context).pop(true),
                child: roundedButton(
                    " Yes ", const Color(0xFFFFC107), const Color(0xFFFFFFFF)),
              ),
            ],
          ),
        ) ??
=======
>>>>>>> Stashed changes
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(false),
            child: roundedButton("No", Color(0xFF212121),
                const Color(0xFFFFFFFF)),
          ),
          new GestureDetector(
            onTap: () => Navigator.of(context).pop(true),
            child: roundedButton(" Yes ", const Color(0xFFFFC107),
                const Color(0xFFFFFFFF)),
          ),
        ],
      ),
    ) ??
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
        false;
  }

  Widget roundedButton(String buttonLabel, Color bgColor, Color textColor) {
    var loginBtn = new Container(
      padding: EdgeInsets.all(5.0),
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: bgColor,
        borderRadius: new BorderRadius.all(const Radius.circular(10.0)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: const Color(0xFF696969),
            offset: Offset(1.0, 6.0),
            blurRadius: 0.001,
          ),
        ],
      ),
      child: Text(
        buttonLabel,
        style: new TextStyle(
            color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
    );
    return loginBtn;
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream

    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

=======
<<<<<<< HEAD
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);
    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: SpacingUnit.w * 10,
            width: SpacingUnit.w * 10,
            margin: EdgeInsets.only(top: SpacingUnit.w * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: SpacingUnit.w * 5,
                  backgroundImage: NetworkImage(
                      'https://cdn.planetradio.co.uk/one/media/5d9b/54cd/a441/05b6/b293/1079/camila-cabello-facts.jpg?quality=80&format=jpg&width=960&ratio=16-9'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: SpacingUnit.w * 2.5,
                    width: SpacingUnit.w * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: SpacingUnit.w * 1.5,
                      widthFactor: SpacingUnit.w * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: DarkPrimaryColor,
                        size: ScreenUtil().setSp(SpacingUnit.w * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: SpacingUnit.w * 2),
          Text(
            'Nicolas Adams',
            style: TitleTextStyle,
          ),
          SizedBox(height: SpacingUnit.w * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: CaptionTextStyle,
          ),
          SizedBox(height: SpacingUnit.w * 2),
          Container(
            height: SpacingUnit.w * 4,
            width: SpacingUnit.w * 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(SpacingUnit.w * 3),
              color: Theme.of(context).accentColor,
            ),
            child: Center(
              child: Text(
                'Upgrade to PRO',
                style: ButtonTextStyle,
              ),
            ),
          ),
        ],
      ),
    );

    var header = Row(
      children: <Widget>[
        profileInfo,
        SizedBox(width: SpacingUnit.w * 3),
      ],
    );
=======

    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);

>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
    return new WillPopScope(
        onWillPop: _onBackPressed,
        child: new Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          drawer: new Drawer(
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
            child: Column(
              children: <Widget>[
                SizedBox(height: SpacingUnit.w * 5),
                header,
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_shield,
                        text: 'Privacy',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.history,
                        text: 'Purchase History',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.question_circle,
                        text: 'Help & Support',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.cog,
                        text: 'Settings',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.user_plus,
                        text: 'Invite a Friend',
                      ),
                      ProfileListItem(
                        icon: LineAwesomeIcons.alternate_sign_out,
                        text: 'Logout',
                        hasNavigation: false,
=======
>>>>>>> Stashed changes
            child: new ListView(
              children: <Widget>[
                new Container(
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
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                      ),
                    ],
                  ),
                ),
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
=======
>>>>>>> Stashed changes
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
                      MaterialPageRoute(builder: (context) => HomeScreen()),
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
                          MaterialPageRoute(builder: (context) => ProfileScreen()));
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
                      "Search",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Search()));
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
                      "Logout",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }),
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
              ],
            ),
          ),
          appBar: new AppBar(
            actions: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 3.0),
                child: MaterialButton(
                    onPressed: () {
<<<<<<< Updated upstream
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()));
=======
<<<<<<< HEAD
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProfileScreen()));
=======
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ProfileScreen()));
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                    },
                    child: Column(
                      children: <Widget>[
                        Padding(
<<<<<<< Updated upstream
                          padding: const EdgeInsets.only(right: 8.0,top:8.0),

                        ),
                        Icon(
                          Icons.account_circle,
                          size: 30.0,
                        ),

=======
<<<<<<< HEAD
                          padding: const EdgeInsets.only(right: 8.0, top: 8.0),
                        ),
                        Icon(
                          Icons.account_circle,
                          size: 30.0,
                        ),
=======
                          padding: const EdgeInsets.only(right: 8.0,top:8.0),

                        ),
                        Icon(
                          Icons.account_circle,
                          size: 30.0,
                        ),

>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                      ],
                    )),
              ),
            ],
          ),
          bottomNavigationBar: new BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 12,
            items: [
              BottomNavigationBarItem(
<<<<<<< Updated upstream
                  icon: Icon(Icons.home, size: 22,),
=======
<<<<<<< HEAD
                  icon: Icon(
                    Icons.home,
                    size: 22,
                  ),
=======
                  icon: Icon(Icons.home, size: 22,),
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Home',
                      style: TextStyle(fontSize: 12),
<<<<<<< Updated upstream
                    ),
                  )),
              BottomNavigationBarItem(
=======
<<<<<<< HEAD
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                    size: 22,
                  ),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 12),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.movie,
                    size: 22,
                  ),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Movies',
                      style: TextStyle(fontSize: 12),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    size: 22,
                  ),
=======
                    ),
                  )),
              BottomNavigationBarItem(
>>>>>>> Stashed changes
                  icon: Icon(Icons.search, size: 22,),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Search',
                      style: TextStyle(fontSize: 12),
                    ),
                  )
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.movie, size: 22,),
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Movies',
                      style: TextStyle(fontSize: 12),
                    ),
                  )),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add, size: 22,),
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                  // ignore: deprecated_member_use
                  title: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Play List',
                      style: TextStyle(fontSize: 12),
                    ),
                  )),
            ],
          ),
          body: CustomScrollView(
<<<<<<< Updated upstream

=======
<<<<<<< HEAD
=======

>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(5),
                    alignment: Alignment.center,
<<<<<<< Updated upstream
                    constraints: BoxConstraints.expand(
                        height: 225
                    ),
=======
<<<<<<< HEAD
                    constraints: BoxConstraints.expand(height: 225),
=======
                    constraints: BoxConstraints.expand(
                        height: 225
                    ),
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                    child: imageSlider(context)),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
                  height: 284.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 130.0, left: 10.0),
=======
>>>>>>> Stashed changes
                  height: 270.0,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, right: 150.0),
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                        child: Text('Come enjoy with us..',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0)),
                      ),
                      Padding(
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 200,
                          child: FutureBuilder<List>(
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 261.0,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 20.0),
                          height: 200,
                          child: FutureBuilder<List>(
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
=======
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
                        ),
                      )
                    ],
                  ),
                ),
              ),
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
            ],
          ),
        ));
  }

  Swiper imageSlider(context) {
    return new Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
          fit: BoxFit.fitHeight,
        );
      },
      itemCount: 10,
      viewportFraction: 0.7,
      scale: 0.8,
=======
>>>>>>> Stashed changes
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
        )
<<<<<<< Updated upstream
    );
  }

  Swiper imageSlider(context){
    return new Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
          fit: BoxFit.fitHeight,
        );
      },
      itemCount: 10,
      viewportFraction: 0.7,
      scale: 0.8,
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
            return SizedBox(
              height: 100,
              width: 100,
              child: Image.network(ApiService.BASE_URL+list[i]['v_poster']),
            );
          },
        );

  }
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
    );
  }

<<<<<<< HEAD
class Items extends StatelessWidget {
  List list;

  Items({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list == null ? 0 : list.length,
      itemBuilder: (ctx, i) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: InkWell(
              splashColor: Colors.blue.withAlpha(30),
              onTap: () {

                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Details()));
              },
              child: Container(
                width: 100,
                child: Column(
                  children: [
                    Image.network(ApiService.BASE_URL + list[i]['v_poster'],height: 124.0, width: 100.0,fit: BoxFit.cover),

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
                  ]
                ),
            )
            ),
          ),
        );
      },
    );
=======
  Swiper imageSlider(context){
    return new Swiper(
      autoplay: true,
      itemBuilder: (BuildContext context, int index) {
        return new Image.network(
          "https://lh3.googleusercontent.com/wIcl3tehFmOUpq-Jl3hlVbZVFrLHePRtIDWV5lZwBVDr7kEAgLTChyvXUclMVQDRHDEcDhY=w640-h400-e365-rj-sc0x00ffffff",
          fit: BoxFit.fitHeight,
        );
      },
      itemCount: 10,
      viewportFraction: 0.7,
      scale: 0.8,
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
            return SizedBox(
              height: 100,
              width: 100,
              child: Image.network(ApiService.BASE_URL+list[i]['v_poster']),
            );
          },
        );

>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
  }
>>>>>>> Stashed changes
}