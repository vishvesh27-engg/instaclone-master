import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instaclone/services/addposts.dart';
import 'package:instaclone/widgets/captionpage.dart';
import 'package:video_player/video_player.dart';
import 'package:instaclone/services/globals.dart' as global;

String? videopath;

class videoview extends StatefulWidget {
  final String vpath;
  const videoview(this.vpath);

  @override
  _videoviewState createState() => _videoviewState();
}

class _videoviewState extends State<videoview> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    videopath = widget.vpath;

    String demo = videopath!.substring(videopath!.length - 3);
    print("path of the video $videopath extension : $demo");

    super.initState();
    _controller = VideoPlayerController.file(File(videopath!))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("ADD MORE!?"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => addposts()));
                },
                child: const Text("YES")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => captionpage()));
                },
                child: const Text("NO")),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: () {
              global.currentpostlist.add(videopath!);
              _showMyDialog();
            },
          )
        ],
      ),
      body: Center(
        child: _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : Container(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _controller!.value.isPlaying
                ? _controller!.pause()
                : _controller!.play();
          });
        },
        child: Icon(
          _controller!.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }
}
