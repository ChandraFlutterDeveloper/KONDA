import 'package:flutter/material.dart';
import 'package:konda_app/Screens/HomeScreen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xFFFB415B), fontFamily: "Ubuntu"),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController u_name = TextEditingController();
  TextEditingController u_pass = TextEditingController();


  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding:
            EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Konda',
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico"),
            ),
            SizedBox(
              height: 40.0,
            ),
            Text(
              "LOGIN",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor),

            ),
            SizedBox(
              height: 40.0,
            ),
            buildTextField("Enter Your Mobile No.,"),
            SizedBox(
              height: 20.0,
            ),
            buildTextField("Enter OTP"),
            SizedBox(
              height: 20.0,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Resend_OTP",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Don't have an account?"),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text("SIGN UP",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
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
        prefixIcon: hintText == "Mobile"
            ? Icon(Icons.messenger_outline)
            : Icon(Icons.phone_android_outlined),
        suffixIcon: hintText == "OTP"
            ? IconButton(
                onPressed: _toggleVisibility,
                icon: _isHidden
                    ? Icon(Icons.visibility_off)
                    : Icon(Icons.visibility),
              )
            : null,
      ),
      obscureText: hintText == "OTP" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer() {
    return GestureDetector(
      onTap: (){

         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        //onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
            colors: [Color(0xFFFB415B), Color(0xFFEE5623)],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Text(
            "LOGIN",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ),
      ),
    );
  }
}
