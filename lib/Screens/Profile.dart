import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konda_app/Screens/login_page.dart';
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
            backgroundColor: Theme.of(context).backgroundColor,
            body: Column(

              children: [
                Container(
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(top: 80, left: 10.0, right: 10.0),
                        child: CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              'https://hemantchandra.com/assets/img/profile-img.jpg'),
                        )),
                    Expanded(
                        child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[


                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 100, right: 8.0, left: 8.0),
                                child: new Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(bottom:8.0),
                                      child: new Text('Konda User',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8,bottom:8.0),
                                      child: new Text('91XXXXXXXX',
                                          style: new TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),

                                  ],
                                ),
                              ),

                              LinearProgressIndicator(
                                value: 0.95,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                              ),
                            ]))
                  ]),
                ),

                Container(
                    child:Padding(
                      padding: const EdgeInsets.only(top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
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
                            title: Text('My Play List',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),


                          ListTile(
                            leading: Icon(Icons.event_note_outlined,color: Colors.blueGrey,),
                            title: Text('Movies',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),
                          Divider(
                            thickness: 5,
                            color: Colors.grey.shade500,
                          ),
                          ListTile(
                            leading: Icon(Icons.book,color: Colors.grey,),
                            title: Text('Update Profile',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                            },
                          ),

                          ListTile(
                            leading: Icon(Icons.contact_support,color: Colors.pink,),
                            title: Text('FAQ & Feedback',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),

                       /*   ListTile(
                            leading: Icon(Icons.person_add_alt,color: Colors.amber,),
                            title: Text('Give the gift of daily yoga',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20)),
                            trailing: Icon(Icons.arrow_forward_ios_outlined,color: Colors.grey,),
                            onTap: (){},
                          ),*/
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
