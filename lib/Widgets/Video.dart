import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:konda_app/constants.dart';


import 'package:animated_theme_switcher/animated_theme_switcher.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
            home: Videoplayer(),
          );
        },
      ),
    );
  }
}
class Videoplayer extends StatefulWidget {
  final String path;

  Videoplayer({Key key, @required this.path}) : super(key: key);

  @override
  _VideoplayerState createState() => new _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  VideoPlayerController _videoPlayerController;
  ChewieController _chewieController;
  Future<void> _future;
  TargetPlatform _platform;

  Future<void> initVideoPlayer() async {
    await _videoPlayerController.initialize();

    setState(() {
      print(_videoPlayerController.value.aspectRatio);
      _chewieController = ChewieController(
        aspectRatio: MediaQuery.of(context).size.height/ MediaQuery.of(context).size.width,
        videoPlayerController: _videoPlayerController,
        autoPlay: false,
        looping: false,

        // showControls: false,
        materialProgressColors: ChewieProgressColors(
          playedColor: Colors.red,
          handleColor: Colors.blue,
          backgroundColor: Colors.grey,
          bufferedColor: Colors.lightGreen,
        ),
        // placeholder: Container(
        //   color: Colors.grey,
        // ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _videoPlayerController = VideoPlayerController.network('https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4');
  //  _videoPlayerController = VideoPlayerController.file(File(widget.path));
    _future = initVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        platform: _platform ?? Theme.of(context).platform,
      ),
      home: Scaffold(
        body: FutureBuilder(
            future: _future,
            builder: (context, snapshot) {
              return _videoPlayerController.value.initialized
                  ? Chewie(
                controller: _chewieController,
              )
                  : Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController.dispose();
    super.dispose();
  }
}