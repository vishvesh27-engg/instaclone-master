import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:instaclone/widgets/videocaption.dart';

class DisplayPost extends StatefulWidget {
  DisplayPost({@required this.name, this.dp, this.caption, this.postimages});
  String? name;
  String? dp;
  List<dynamic>? postimages;
  String? caption;
  @override
  _DisplayPostState createState() =>
      _DisplayPostState(name, dp, caption, postimages);
}

class _DisplayPostState extends State<DisplayPost> {
  _DisplayPostState(
      @required this.name, this.dp, this.caption, this.postimages);
  String? name;
  String? dp;
  List<dynamic>? postimages;
  String? caption;
  String _myImage = "assets/heartlogo.png";
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var aheight = AppBar().preferredSize.height;
    return Column(
      children: [
        Container(
            child: Row(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(
                  height / 400, height / 168, height / 400, height / 168),
              child: CircleAvatar(
                radius: height * 0.035,
                backgroundImage: FileImage(File(dp!)),
              ),
            ),
            Padding(
                padding: EdgeInsets.all(height / 200),
                child: Text('$name',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold))),
          ],
        )),
        Container(
          width: width,
          height: height * 0.5,
          child: Swiper(
            loop: false,
            pagination: SwiperPagination(),
            itemBuilder: (BuildContext context, int index) {
              var extension =
                  postimages![index].substring(postimages![index].length - 3);
              if (extension == "mp4") {
                return videocaption(postimages![index]);
              } else {
                return Container(
                    height: height / 3,
                    width: width,
                    child: Image(image: FileImage(File(postimages![index]))));
              }
            },
            itemCount: postimages!.length,
          ),
        ),
        Container(
            child: Row(
          children: [
            Padding(
                padding: EdgeInsets.fromLTRB(
                    0, aheight * 0.25, aheight * 0.1, aheight * 0.3),
                child: GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.white,
                        content: Text('You Have Liked This Post',
                            style: TextStyle(color: Colors.blue)),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      setState(() {
                        if (_myImage == "assets/heartlogo.png") {
                          _myImage =
                              "assets/liked.png"; //change myImage to the other one
                        } else {
                          _myImage =
                              "assets/heartlogo.png"; //change myImage back to the original one
                        }
                      });
                    },
                    child: Image(
                        image: AssetImage(_myImage), height: aheight * 0.4))),
            IconButton(onPressed: () {}, icon: Icon(Icons.comment)),
            Padding(
                padding: EdgeInsets.fromLTRB(
                    0, aheight * 0.25, aheight * 0.1, aheight * 0.3),
                child: GestureDetector(
                    onTap: () {},
                    child: Image(
                        image: AssetImage("assets/dmlogo.png"),
                        height: aheight * 0.4)))
          ],
        )),
        Container(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(height * 0.01, height * 0.005,
                    height * 0.01, height * 0.005),
                child: Text("$name",
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Text(
                "$caption",
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}
