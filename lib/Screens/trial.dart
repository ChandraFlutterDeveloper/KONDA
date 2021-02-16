/*
import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: followButton(),
      body: Stack(
        children: <Widget>[
          ClipPath(
            child: Container(
              color: Colors.black.withOpacity(0.8),
            ),

          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: MediaQuery.of(context).size.height / 6.0,
            // left: 76.0,
            child: Column(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    Container(
                      width: 150.0,
                      height: 150.0,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/profile.jpeg"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(80.0),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: Colors.black,
                            offset: Offset(5.0, 6.0),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 20.0,
                      right: 20.0,
                      child: InkWell(
                        child: Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 28.0,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              builder: ((builder) => BottomShhetWidget()));
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



// bottomsheet


File imageFile;

class BottomShhetWidget extends StatefulWidget {
  @override
  _BottomShhetWidgetState createState() => _BottomShhetWidgetState();
}

class _BottomShhetWidgetState extends State<BottomShhetWidget> {
  void takePhotoByCamera() async {
    File image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      imageFile = image;
    });
  }

  void takePhotoByGallery() async {
    File image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageFile = image;
    });
  }

  void removePhoto() {
    setState(() {
      imageFile = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250.0,
      width: 250.0,
      margin: EdgeInsets.only(left: 30.0, top: 25.0),
      child: Column(
        children: <Widget>[
          Text(
            "Profile photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20.0, top: 20.0),
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.camera),
                  onPressed: takePhotoByCamera,
                  label: Text("Camera"),
                ),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                ),
                FlatButton.icon(
                  icon: Icon(Icons.image),
                  onPressed: takePhotoByGallery,
                  label: Text("Gallery"),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 40.0, top: 10.0),
            child: Row(
              children: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.delete),
                  onPressed: removePhoto,
                  label: Text("Remove"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}*/
