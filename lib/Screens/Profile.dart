import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
<<<<<<< Updated upstream
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:konda_app/constants.dart';
import 'package:konda_app/widgets/profile_list_item.dart';
=======
<<<<<<< HEAD
import 'package:konda_app/constants.dart';

=======
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:konda_app/constants.dart';
import 'package:konda_app/widgets/profile_list_item.dart';
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes

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

<<<<<<< Updated upstream
=======
<<<<<<< HEAD


=======
>>>>>>> Stashed changes
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
                  backgroundImage: AssetImage('assets/images/avatar.png'),
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
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes

    return ThemeSwitchingArea(
      child: Builder(
        builder: (context) {
          return Scaffold(
            body: Column(
<<<<<<< Updated upstream
=======
<<<<<<< HEAD

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

=======
>>>>>>> Stashed changes
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
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
<<<<<<< Updated upstream
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
        },
      ),
    );
  }
}
