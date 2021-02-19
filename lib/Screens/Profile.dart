import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:konda_app/Screens/Movies.dart';
import 'package:konda_app/Screens/MyList.dart';
import 'package:konda_app/Screens/login_page.dart';
import 'package:konda_app/Service/ApiService.dart';
import 'package:konda_app/constants.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

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

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key key}) : super(key: key);

  @override
  ProfileScreenState createState() => ProfileScreenState();
}

class ProfileScreenState extends State<ProfileScreen> {

  String u_id = '';

  File _image;
  final picker = ImagePicker();


  _imgFromCamera() async {
    var pickedImage = await picker.getImage(source: ImageSource.camera, imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  _imgFromGallery() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery, imageQuality: 50);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }


  getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      u_id = preferences.getString("id");
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }


  Future uploadImage()async{
    final uri = Uri.parse(ApiService.BASE_URL+"Profile_image_upload");
    var request = http.MultipartRequest('POST',uri);
    request.fields['u_id'] = u_id;
    var pic = await http.MultipartFile.fromPath("image", _image.path);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image Uploded');
    }else{
      print('Image Not Uploded');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.grey,
            )),
      ),
      body: ListView(
        children: <Widget>[
          Stack(alignment: Alignment.center, children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: _image == null  //profilePhoto which is File object
                            ? AssetImage(
                            "assets/images/avtar.png")
                            : FileImage(_image), // picked file
                        fit: BoxFit.fill)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 100, top: 120),
              child: Align(
                alignment: Alignment.center,
                child: Container(
                  height: SpacingUnit.w * 2.5,
                  width: SpacingUnit.w * 2.5,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {

                      _showPicker(context);
                     //    choiceImage();

                    },
                    child: Icon(
                      LineAwesomeIcons.retro_camera,
                      color: DarkPrimaryColor,
                      size: ScreenUtil().setSp(SpacingUnit.w * 2),
                    ),
                  ),
                ),
              ),
            ),
          ]),
          Container(
              child: Padding(
            padding: const EdgeInsets.only(
                top: 25.0, left: 15.0, right: 15.0, bottom: 15.0),
            child: Column(
              children: <Widget>[
                Divider(
                  color: Colors.grey,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_add_alt,
                    color: Colors.orangeAccent,
                  ),
                  title: Text(
                    'Invite Friends',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    share();
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.speaker_notes_sharp,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    'My Play List',
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => MyList(),
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.event_note_outlined,
                    color: Colors.blueGrey,
                  ),
                  title: Text('Movies', style: TextStyle(fontSize: 20)),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => Movies(),
                    ));
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.book,
                    color: Colors.grey,
                  ),
                  title: Text('Update Profile', style: TextStyle(fontSize: 20)),
                  trailing: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: Colors.grey,
                  ),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                ),
              ],
            ),
          )),
        ],
      ),
    );
  }

  _loadPicker(ImageSource source) async {
    // ignore: deprecated_member_use
    File picked = await ImagePicker.pickImage(source: source);
    if (picked != null) {
      _cropImage(picked);
    }
    Navigator.pop(context);
  }

  _cropImage(File picked) async {
    File cropped = await ImageCropper.cropImage(
      androidUiSettings: AndroidUiSettings(
        statusBarColor: Colors.red,
        toolbarColor: Colors.red,
        toolbarTitle: "Crop Image",
        toolbarWidgetColor: Colors.white,
      ),
      sourcePath: picked.path,
      aspectRatioPresets: [

        CropAspectRatioPreset.square,
        
      ],
      maxWidth: 800,
    );
    if (cropped != null) {
      setState(() {
     //   _pickedImage = cropped;
      });
    }
  }

  void _showPickOptionsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              title: Text("Pick from Gallery"),
              onTap: () {
                _loadPicker(ImageSource.gallery);
              },
            ),
            ListTile(
              title: Text("Take a picture"),
              onTap: () {
                _loadPicker(ImageSource.camera);
              },
            )
          ],
        ),
      ),
    );
  }
}

Future<void> share() async {
  await FlutterShare.share(
      title: 'KONDA',
      text: 'Enjoy With KONDA',
      linkUrl:
          'https://play.google.com/store/apps/details?id=in.co.konda.htkc.konda_app',
      chooserTitle: 'Share With Your Friends...');
}




