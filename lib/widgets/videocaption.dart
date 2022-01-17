import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

String? videopath;

Duration? duration;

class videocaption extends StatefulWidget {
  String vpath;
  videocaption(this.vpath);
  @override
  _videocaptionState createState() => _videocaptionState();
}

class _videocaptionState extends State<videocaption> {
  VideoPlayerController? _controller;
  @override
  void initState() {
    super.initState();
    videopath = widget.vpath;
    _controller = VideoPlayerController.file(File(videopath!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller!.dispose();

    super.dispose(); //Super should be called at the very end of dispose
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
        height: size.height / 3,
        width: size.width,
        child: GestureDetector(
            onTap: () {
              setState(() {
                _controller!.value.isPlaying
                    ? _controller!.pause()
                    : _controller!.play();
              });
            },
            child: VideoPlayer(_controller!)));
  }
}
