import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konda_app/constants.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: ProfileScreen(),
          );
        },
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, height: 896, width: 414, allowFontScaling: true);




    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(

              children: [
                Container(
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 30, left: 10.0, right: 10.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              'https://cdn.planetradio.co.uk/one/media/5d9b/54cd/a441/05b6/b293/1079/camila-cabello-facts.jpg?quality=80&format=jpg&width=960&ratio=16-9'),
                        )),
                    Expanded(
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: new Text(
                                  'Camila Cabello',
                                  style: new TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              new SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, right: 8.0, left: 8.0),
                                child: new Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: new Column(children: <Widget>[
                                        new Text('1208',
                                            style: new TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold)),
                                        new Text('Followers',
                                            style: new TextStyle(
                                                fontSize: 12.0, color: Colors.black)),
                                      ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: new Column(
                                        children: <Widget>[
                                          new Text(
                                            '380',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          new Text(
                                            'Following',
                                            style: TextStyle(
                                                fontSize: 12, color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: new Text('Level 1'),
                              ),
                              LinearProgressIndicator(
                                value: .4,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ]))
                  ]),
                ),

                Container(
                    child:Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.person_add_alt,color: Colors.orangeAccent,),
                            title: Text('Invite Friends',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),

                          ListTile(
                            leading: Icon(Icons.speaker_notes_sharp,color: Colors.redAccent,),
                            title: Text('Ability Test',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),


                          ListTile(
                            leading: Icon(Icons.event_note_outlined,color: Colors.blueGrey,),
                            title: Text('My Topics',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),
                          ListTile(
                            leading: Icon(Icons.download_outlined,color: Colors.cyan,),
                            title: Text('Downloads Management',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),
                          Divider(
                            thickness: 5,
                            color: Colors.grey.shade500,
                          ),
                          ListTile(
                            leading: Icon(Icons.book,color: Colors.grey,),
                            title: Text('Coupons',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),

                          ListTile(
                            leading: Icon(Icons.contact_support,color: Colors.pink,),
                            title: Text('FAQ & Feedback',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),

                          ListTile(
                            leading: Icon(Icons.person_add_alt,color: Colors.amber,),
                            title: Text('Give the gift of daily yoga',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),
                        ],
                      ),
                    )
                ),

              ],
            ),
          );

        },
      ),
    );
  }
}
