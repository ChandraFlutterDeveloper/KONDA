import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:konda_app/Screens/UserRegister.dart';
import 'package:konda_app/MainMenu.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

enum LoginStatus { notSignIn, signIn }

class _LoginState extends State<Login> {
  LoginStatus _loginStatus = LoginStatus.notSignIn;
  String email, password;
  final _key = new GlobalKey<FormState>();

  bool _secureText = true;

  saveIntro(String first) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("first", first);
    });
  }


  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  bool visible = false;

  loadProgress(){

    setState(() {
      visible = true;
    });
    check();
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      login();
    }
  }

  login() async {
    final response = await http
        .post(ApiService.BASE_URL+"User_Signin", body: {
      "email": email,
      "password": password
    });

    final data = jsonDecode(response.body);
    bool value = data['error'];
    String success = data['success'];
    String uemail = data['uemail'];
    String uname = data['uname'];
    String otp = data['otp'];
    String mobile = data['mobile'];
    String id = data['uid'];

    if (!value) {
      setState(() {
        _loginStatus = LoginStatus.signIn;
        savePref(otp,mobile, uemail, uname, id);
        visible = false;
      });
      print("Success: "+success);
      loginSuccessToast("Successfully Logged In!");
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (BuildContext context) =>
                  MainMenu(signOut)));
    } else {

      setState(() {
        visible = false;
      });
      print("fail");
      print("Success: "+success);
      loginFailedToast("Something Went Wrong! Please try again later");
    }
  }

  loginSuccessToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
  loginFailedToast(String toast) {
    return Fluttertoast.showToast(
        msg: toast,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white);
  }

  savePref(String otp, String mobile, String email, String name, String id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("otp", otp);
      preferences.setString("name", name);
      preferences.setString("email", email);
      preferences.setString("mobile", mobile);
      preferences.setString("id", id);
      preferences.commit();
    });
  }


  signOut() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      preferences.setString("mobile",null);
      preferences.setString("name",null);
      preferences.setString("email",null);
      preferences.setString("id",null);
      preferences.setString("otp",null);
      _loginStatus = LoginStatus.notSignIn;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Login(),
        ),);
    });
  }

  String value;

  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      value = preferences.getString("id");

      if(value != null){
        _loginStatus = LoginStatus.signIn;
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    MainMenu(signOut)));
      }else{
        _loginStatus = LoginStatus.notSignIn;
      }
    });
  }


  Future<bool> _onBackPressed() {
    return showDialog(
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
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
    saveIntro("first");
  }

  @override
  Widget build(BuildContext context) {
    switch (_loginStatus) {
      case LoginStatus.notSignIn:
        return new WillPopScope(
            onWillPop: _onBackPressed,
            child: new Scaffold(
              body: Center(
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(15.0),
                  children: <Widget>[

                    Center(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
    //            color: Colors.grey.withAlpha(20),

                        child: Form(
                          key: _key,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Image.asset(
                                  "assets/images/logos.png"),
                              SizedBox(
                                height: 35,
                              ),

                              SizedBox(
                                height: 50,
                                child: Text(
                                  "Login",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 30.0),
                                ),
                              ),

                              Visibility(
                                  maintainSize: true,
                                  maintainAnimation: true,
                                  maintainState: true,
                                  visible: visible,
                                  child: Container(
                                      margin: EdgeInsets.only(top: 10, bottom: 10),
                                      child: CircularProgressIndicator()
                                  )
                              ),

                              //card for Email TextFormField
                              Card(
                                elevation: 6.0,
                                child: TextFormField(
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "Please Insert Email";
                                    }
                                  },
                                  onSaved: (e) => email = e,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  decoration: InputDecoration(
                                      prefixIcon: Padding(
                                        padding:
                                        EdgeInsets.only(left: 20, right: 15),
                                        child:
                                        Icon(Icons.person),
                                      ),
                                      contentPadding: EdgeInsets.all(18),
                                      labelText: "Email"),
                                ),
                              ),

                              // Card for password TextFormField
                              Card(
                                elevation: 6.0,
                                child: TextFormField(
                                  validator: (e) {
                                    if (e.isEmpty) {
                                      return "Password Can't be Empty";
                                    }
                                  },
                                  obscureText: _secureText,
                                  onSaved: (e) => password = e,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  decoration: InputDecoration(
                                    labelText: "Password",
                                    prefixIcon: Padding(
                                      padding: EdgeInsets.only(left: 20, right: 15),
                                      child: Icon(Icons.phonelink_lock,
                                      ),
                                    ),
                                    suffixIcon: IconButton(
                                      onPressed: showHide,
                                      icon: Icon(_secureText
                                          ? Icons.visibility_off
                                          : Icons.visibility),
                                    ),
                                    contentPadding: EdgeInsets.all(18),
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 12,
                              ),

                              FlatButton(
                                onPressed: null,
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),

                              Padding(
                                padding: EdgeInsets.all(14.0),
                              ),

                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  SizedBox(
                                    height: 44.0,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0)),
                                        child: Text(
                                          "Login",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.blueAccent,
                                        onPressed: () {
                                          loadProgress();
                                        }),
                                  ),
                                  SizedBox(
                                    height: 44.0,
                                    child: RaisedButton(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(15.0)),
                                        child: Text(
                                          "GoTo Register",
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                        textColor: Colors.white,
                                        color: Colors.red,
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Register()),
                                          );
                                        }),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
        );
        break;

      case LoginStatus.signIn:
        return MainMenu(signOut);
//        return ProfilePage(signOut);
        break;
    }
  }
}
