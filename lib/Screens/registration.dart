import 'package:flutter/material.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';
void main() => runApp(App());

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Color(0xFFFB415B),
          fontFamily: "Ubuntu"
      ),
      home: Register(),
    );
  }
}

class Register extends StatefulWidget{
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController u_name = TextEditingController();
  TextEditingController u_pass = TextEditingController();

  Future register() async {
    var url = "https://konda.co.in/User_Signin";
    var response = await http.post(url, body: {
    /*  "mobile" = u_name.text,
      "u_pass" = u_pass.text,*/
    });
    var data = json.decode(response.body);
    if (data == Error) {
      Fluttertoast.showToast(
          msg: "This user already exit!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
    }
    else{
      Fluttertoast.showToast(
          msg: "Registration successful!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0
      );
      }


}
  bool _isHidden = true;

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            SizedBox(height: 40.0,),
            Text(
              "Register Yourself",
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 40.0,),
            buildTextField("Enter Your Name,",),
            SizedBox(height: 20.0,),
            buildTextField("Enter Email"),
            SizedBox(height: 20.0,),
            buildTextField("Enter Mobile No"),
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[],
              ),
            ),
            SizedBox(height: 50.0),
            buildButtonContainer(),
            SizedBox(height: 10.0,),
            Container(
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Have an account?"),
                    SizedBox(width: 10.0,),
                    Text("Sign In", style: TextStyle(color: Theme.of(context).primaryColor,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String hintText){
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
        prefixIcon: hintText == "Mobile" ? Icon(Icons.messenger_outline) : Icon(Icons.phone_android_outlined),
        suffixIcon: hintText == "OTP" ? IconButton(
          onPressed: _toggleVisibility,
          icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
        ) : null,
      ),
      obscureText: hintText == "OTP" ? _isHidden : false,
    );
  }

  Widget buildButtonContainer(){

    return GestureDetector(
      onTap: (){
        register();
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
      },
      child: Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
            colors: [
              Color(0xFFFB415B),
              Color(0xFFEE5623)
            ],
            begin: Alignment.centerRight,
            end: Alignment.centerLeft,
          ),
        ),
        child: Center(
          child: Text(
            "Click to Register",
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