import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:konda_app/Screens/HomeScreen.dart';
<<<<<<< Updated upstream
=======
<<<<<<< HEAD
import 'package:konda_app/Screens/login_page.dart';
=======
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
import 'package:konda_app/Service/my_shared_preferance.dart';
import 'package:konda_app/constants.dart';

import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(DarkPrimaryColor);
    return ThemeProvider(

      initTheme: DarkTheme,
      child: Builder(
        builder: (context) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context),
            home: IntroScreen(),
          );
        },
      ),
    );
  }
}

class IntroScreen extends StatefulWidget {
  IntroScreen({Key key}) : super(key: key);

  @override
  IntroScreenState createState() => new IntroScreenState();
}

//------------------ Custom your own tabs ------------------
class IntroScreenState extends State<IntroScreen> {
  List<Slide> slides = new List();

  Function goToTab;

  bool isFirstTimeOpen = false;

  IntroScreenState() {
    MySharedPreferences.instance
        .getBooleanValue("firstTimeOpen")
        .then((value) => setState(() {
      isFirstTimeOpen = value;
    }));
  }

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Konda",
        styleTitle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Konda Present New Indian Movies App",
        styleDescription: TextStyle(
            color: Color(0x99FFFFFF),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
<<<<<<< Updated upstream
        pathImage: "assets/images/konda.png",
=======
<<<<<<< HEAD
        pathImage: "assets/icons/konda.png",
=======
        pathImage: "assets/images/konda.png",
>>>>>>> 7e979592e841631abd127984d3b039e98fd17967
>>>>>>> Stashed changes
      ),
    );
    slides.add(
      new Slide(
        title: "TV",
        styleTitle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Konda also present live Tv",
        styleDescription: TextStyle(
            color: Color(0x99FFFFFF),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/tv.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Web Series",
        styleTitle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Konda Presents Web Series",
        styleDescription: TextStyle(
            color: Color(0x99FFFFFF),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/movie1.png",
      ),
    );
  }

  void onDonePress() {
    // Back to the first tab
    // this.goToTab(0);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  void onTabChangeCompleted(index) {
    // Index of current tab is focused
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xFF4FC3F7),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xFF4FC3F7),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xFF4FC3F7),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = new List();
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(Container(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: EdgeInsets.only(bottom: 60.0, top: 60.0),
          child: ListView(
            children: <Widget>[
              GestureDetector(
                  child: Image.asset(
                    currentSlide.pathImage,
                    width: 200.0,
                    height: 200.0,
                    fit: BoxFit.contain,
                  )),
              Container(
                child: Text(
                  currentSlide.title,
                  style: currentSlide.styleTitle,
                  textAlign: TextAlign.center,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
              Container(
                child: Text(
                  currentSlide.description,
                  style: currentSlide.styleDescription,
                  textAlign: TextAlign.center,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                ),
                margin: EdgeInsets.only(top: 20.0),
              ),
            ],
          ),
        ),
      ));
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      colorSkipBtn: Color(0x33ffcc5c),
      highlightColorSkipBtn: Color(0xFF4FC3F7),

      // Next button
      renderNextBtn: this.renderNextBtn(),

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      colorDoneBtn: Color(0x33ffcc5c),
      highlightColorDoneBtn: Color(0xFF4FC3F7),

      // Dot indicator
      colorDot: Color(0xFF4FC3F7),
      sizeDot: 13.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,

      // Tabs
      listCustomTabs: this.renderListCustomTabs(),
      backgroundColorAllSlides: DarkPrimaryColor,
      refFuncGoToTab: (refFunc) {
        this.goToTab = refFunc;
      },

      // On tab change completed
      onTabChangeCompleted: this.onTabChangeCompleted,
    );
  }
}
