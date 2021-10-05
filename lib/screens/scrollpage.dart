import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:instaclone/screens/dmpage.dart';

class Post extends StatefulWidget {
  Post({@required this.name, this.dp, this.postimage, this.caption});
  final name;
  final dp;
  final postimage;
  final caption;
  @override
  _PostState createState() =>
      _PostState(name: name, dp: dp, postimage: postimage, caption: caption);
}

class _PostState extends State<Post> {
  _PostState({@required this.name, this.dp, this.postimage, this.caption});
  final name;
  final dp;
  final postimage;
  final caption;
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
                backgroundImage: AssetImage(dp),
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
            child: Image(
              image: AssetImage(postimage),
              fit: BoxFit.fill,
            )),
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
                child: Text(name,
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Text(
                caption,
                style: TextStyle(color: Colors.black),
              )
            ],
          ),
        )
      ],
    );
  }
}

class ScrollPage extends StatefulWidget {
  static const String id = '/scroll';
  @override
  _ScrollPageState createState() => _ScrollPageState();
}

class _ScrollPageState extends State<ScrollPage> {
  @override
  Widget build(BuildContext context) {
    var aheight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.camera_alt),
                color: Colors.black,
                tooltip: 'Click a picture',
                onPressed: () {},
              ),
              title: Padding(
                  padding: EdgeInsets.fromLTRB(aheight * 0.2, aheight * 0.1,
                      aheight * 0.2, aheight * 0.1),
                  child: Container(
                      height: aheight * 0.8,
                      width: width * 0.6,
                      child: Image(
                        image: AssetImage("assets/instagramlogo.png"),
                        fit: BoxFit.scaleDown,
                      ))),
              actions: [
                Padding(
                    padding: EdgeInsets.fromLTRB(
                        0, aheight * 0.25, aheight * 0.1, aheight * 0.3),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, DmPage.id);
                        },
                        child: Image(
                            image: AssetImage("assets/dmlogo.png"),
                            height: aheight * 0.6)))
              ]),
          // bottomNavigationBar: BottomNavigationBar(
          //   showUnselectedLabels: false,
          //   showSelectedLabels: false,
          //   items: [
          //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          //     BottomNavigationBarItem(
          //         icon: Icon(Icons.search), label: 'search'),
          //     BottomNavigationBarItem(
          //       icon: Padding(
          //         padding: EdgeInsets.fromLTRB(
          //             height / 400, height / 168, height / 400, height / 168),
          //         child: CircleAvatar(
          //           radius: height * 0.015,
          //           backgroundImage: AssetImage("assets/storyimage1.jpg"),
          //         ),
          //       ),
          //       label: 'search',
          //     ),
          //   ],
          // ),
          body: Column(children: [
            Container(
                child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage1.jpg"),
                          ),
                        ),
                        Text('Your Story') //16characters max
                      ])),
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage2.jpg"),
                          ),
                        ),
                        Text('idontexist') //16characters max
                      ])),
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage3.jpg"),
                          ),
                        ),
                        Text('peace') //16characters max
                      ])),
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage4.jpg"),
                          ),
                        ),
                        Text('getlost') //16characters max
                      ])),
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage5.jpg"),
                          ),
                        ),
                        Text('sunkissed') //16characters max
                      ])),
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage6.jpg"),
                          ),
                        ),
                        Text('reynakd') //16characters max
                      ])),
                  Container(
                      height: height / 8.43,
                      width: height / 10,
                      child: Column(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(height / 400,
                              height / 168, height / 400, height / 168),
                          child: CircleAvatar(
                            radius: height * 0.035,
                            backgroundImage:
                                AssetImage("assets/storyimage7.jpg"),
                          ),
                        ),
                        Text('liam27') //16characters max
                      ])),
                ],
              ),
            )),
            Container(
                height: height * 0.7,
                width: width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(children: [
                    Post(
                      name: 'soul_21',
                      dp: 'assets/storyimage1.jpg',
                      postimage: 'assets/postimage1.jpg',
                      caption: 'endless roads give the best journeys',
                    ),
                    Post(
                      name: 'idontexist',
                      dp: 'assets/storyimage2.jpg',
                      postimage: 'assets/postimage2.jpg',
                      caption: 'let me click a picture of your beauty',
                    ),
                    Post(
                      name: 'peace',
                      dp: 'assets/storyimage3.jpg',
                      postimage: 'assets/postimage3.jpg',
                      caption: 'vacation time',
                    ),
                    Post(
                      name: 'getlost',
                      dp: 'assets/storyimage4.jpg',
                      postimage: 'assets/postimage4.jpg',
                      caption: 'time to focus',
                    ),
                    Post(
                      name: 'sunkissed',
                      dp: 'assets/storyimage5.jpg',
                      postimage: 'assets/postimage5.jpg',
                      caption: 'elephant power #animalsupremacy',
                    ),
                    Post(
                      name: 'reynakd',
                      dp: 'assets/storyimage6.jpg',
                      postimage: 'assets/postimage6.jpg',
                      caption: '2 sides to any story',
                    ),
                    Post(
                      name: 'liam27',
                      dp: 'assets/storyimage7.jpg',
                      postimage: 'assets/postimage7.jpg',
                      caption: 'hey there how u doin',
                    ),
                    Post(
                      name: 'soul_21',
                      dp: 'assets/storyimage1.jpg',
                      postimage: 'assets/postimage8.jpg',
                      caption: 'family time is always wonderful',
                    ),
                    Post(
                      name: 'idontexist',
                      dp: 'assets/storyimage2.jpg',
                      postimage: 'assets/postimage9.jpg',
                      caption: 'roar like a tiger',
                    ),
                    Post(
                      name: 'reynakd',
                      dp: 'assets/storyimage6.jpg',
                      postimage: 'assets/postimage10.jpg',
                      caption: 'looked pretty today ',
                    ),
                  ]),
                ))
          ])),
    );
  }
}
