import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:instaclone/screens/homepage.dart';
import 'package:instaclone/screens/profilepage.dart';
import 'package:instaclone/services/globals.dart' as global;
import 'package:instaclone/widgets/videocaption.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import 'package:path/path.dart' as Path;

class captionpage extends StatefulWidget {
  const captionpage({Key? key}) : super(key: key);

  @override
  _captionpageState createState() => _captionpageState();
}

class _captionpageState extends State<captionpage> {
  String caption = "";
  int _swiperindex = 0;
  String extension = "";
  VideoPlayerController? _controller;
  List<String> finalpaths = [];
  @override
  Widget build(BuildContext context) {
    Future<String> getfinalpaths() async {
      late File storedimage;
      for (var i = 0; i < global.currentpostlist.length; i++) {
        final Directory = await getApplicationDocumentsDirectory();
        final name = Path.basename(global.currentpostlist[i]);
        storedimage = File('${Directory.path}/$name');
        await File(global.currentpostlist[i]).copy(storedimage.path);
        finalpaths.add(storedimage.path);
      }
      return storedimage.path;
    }

    void savepost() async {
      await getfinalpaths();

      await FirebaseFirestore.instance
          .collection('posts')
          .doc(global.id)
          .collection('userposts')
          .doc("post${global.posts + 1}")
          .set({"caption": caption, "postimages": finalpaths});
      global.posts = global.posts + 1;
      final id = global.id;
      final user = await FirebaseFirestore.instance
          .collection('users')
          .doc(id)
          .update({'posts': global.posts});
      global.currentpostlist = [];
      finalpaths = [];
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => HomePage()));
    }

    List<String> curr_path = global.currentpostlist;
    Size size = MediaQuery.of(context).size;

    var captioncontrol = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                savepost();
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          SizedBox(
              height: size.height / 2.8,
              width: size.width,
              child: Swiper(
                  pagination: SwiperPagination(),
                  itemBuilder: (BuildContext context, int index) {
                    print("$_swiperindex");
                    print(global.currentpostlist);
                    extension =
                        curr_path[index].substring(curr_path[index].length - 3);
                    if (extension == "mp4") {
                      return videocaption(curr_path[index]);
                      // initialisecontroller(curr_path[index]);
                      // return Container(
                      //     height: size.height / 3,
                      //     width: size.width,
                      //     child: VideoPlayer(_controller!));
                    } else {
                      return Container(
                          height: size.height / 3,
                          width: size.width,
                          child:
                              Image(image: FileImage(File(curr_path[index]))));
                    }
                  },
                  itemCount: global.currentpostlist.length,
                  onIndexChanged: (index) {
                    if (_controller != null) {
                      _controller!.dispose();
                    }
                    setState(() {
                      _swiperindex = index;
                    });
                  })),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: TextFormField(
              controller: captioncontrol,
              cursorColor: Colors.blue,
              //initialValue: captions[_swiperindex],
              // controller: mUsername_Controller,
              onChanged: (text) {
                caption = text;
              },

              //onEditingComplete: (input) => mController.text,
              style: TextStyle(color: Colors.blue),
              decoration: const InputDecoration(
                fillColor: Colors.blue,
                focusColor: Colors.blue,
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue)),
                labelText: 'Description/your story',
                labelStyle: TextStyle(color: Colors.blue, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
