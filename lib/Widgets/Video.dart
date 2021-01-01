import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class Video extends StatefulWidget {
  final VideoPlayerController videoPlayerController;
  final bool loop;
  Video ({@required this.videoPlayerController, this.loop, Key key}) : super(key: key);
  @override
  _VideoState createState() => _VideoState();
}
class _VideoState extends State<Video> {
  ChewieController _chewieController;

  @override
  void initState(){
super.initState();
_chewieController = ChewieController(
  videoPlayerController: widget.videoPlayerController,
  looping: widget.loop,
  aspectRatio:16/9 ,
  autoInitialize: true,
    );
  }
  Widget build(BuildContext context) {
    return Chewie(
      controller:  _chewieController,
    );
  }

  @override
  void dispose(){
    super.dispose();
    widget.videoPlayerController.dispose();
    _chewieController.dispose();
  }
}

class Videoplayer extends StatefulWidget {
  final String videoData;
  Videoplayer({this.videoData});
  @override
  _VideoplayerState createState() => _VideoplayerState();
}

class _VideoplayerState extends State<Videoplayer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Video(
          loop: true,
          videoPlayerController: VideoPlayerController.asset('assets/videos/Yaarr_Ni_Milyaa_(Full_Song)_Hardy_Sandhu___B_Praak___Jaani___Arvindr_Khaira___Ne.mp4'),
        ),
      ),
    )
    );
  }
}
