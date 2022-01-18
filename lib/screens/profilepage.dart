import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/main.dart';
import 'package:instaclone/screens/editprofile.dart';
import 'package:instaclone/screens/myhome.dart';
import 'package:instaclone/services/globals.dart' as global;

List<QueryDocumentSnapshot<Map<String, dynamic>>>? result;
String? extension;

class ProfilePage extends StatefulWidget {
  static const String id = '/profile';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late StreamSubscription<User?> _listener;
  @override
  void dispose() {
    _listener.cancel();
    super.dispose();
  }

  CollectionReference ref = FirebaseFirestore.instance
      .collection('posts')
      .doc(global.id)
      .collection('userposts');

  @override
  Widget build(BuildContext context) {
    print("${global.posts}");
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(),
          leadingWidth: 0,
          title: Row(children: [
            Text(
              global.username,
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ]),
          actions: [
            IconButton(
                onPressed: () {
                  logoutuser();
                },
                icon: Icon(
                  Icons.logout,
                  color: Colors.black,
                ))
          ],
        ),
        body: Column(
          children: [
            Container(
                height: height / 6,
                width: width,
                child: Row(children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                        height / 200, height / 70, height / 400, height / 168),
                    child: CircleAvatar(
                      radius: height * 0.06,
                      backgroundImage: FileImage(File(global.profilepic)),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            height / 20, height / 14, height / 20, 0),
                        child: Text(
                          "${global.posts}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        "Posts",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            height / 30, height / 14, height / 30, 0),
                        child: Text(
                          "${global.followers}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        "Followers",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            height / 20, height / 14, height / 20, 0),
                        child: Text(
                          "${global.following}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        "Following",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      )
                    ],
                  )
                ])),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(height / 80, 0, 0, 0),
                    child: Text(
                      global.name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ))),
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.fromLTRB(height / 80, 0, 0, 0),
                    child: Text(
                      global.bio,
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ))),
            Container(
                height: height * 0.1,
                width: width * 0.9,
                padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Editprofile.id);
                    },
                    child: Text('Edit Profile'))),
            // Container(
            // padding: EdgeInsets.fromLTRB(
            //     height / 300, height / 20, height / 300, 0),
            // height: height * 0.5,
            // width: width,
            //     child: GridView.builder(
            //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //           crossAxisCount: 5,
            //           crossAxisSpacing: 5.0,
            //           mainAxisSpacing: 5.0,
            //         ),
            //         itemCount: global.posts,
            //         itemBuilder: (context, index) {
            //           extension = result![index]["postimages"][0].substring(
            //               result![index]["postimages"][0].length - 3);
            //           // if (extension == "mp4") {
            //           //   return Container();
            //           // } else {
            //           return Container(
            //             height: height * 0.3,
            //             width: width * 0.5,
            //             child: Image(
            //               image:
            //                   FileImage(File(result![index]["postimages"][0])),
            //               fit: BoxFit.fill,
            //             ),
            //           );
            //         }
            //         // },
            //         )),
            Container(
              padding: EdgeInsets.fromLTRB(
                  height / 300, height / 20, height / 300, 0),
              height: height * 0.5,
              width: width,
              child: StreamBuilder(
                  stream: ref.snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 5.0,
                          mainAxisSpacing: 5.0,
                        ),
                        itemCount:
                            snapshot.hasData ? snapshot.data!.docs.length : 0,
                        itemBuilder: (context, index) {
                          extension = snapshot
                              .data!.docs[index]["postimages"][0]
                              .substring(snapshot.data!
                                      .docs[index]["postimages"][0].length -
                                  3);
                          // if (extension == "mp4") {
                          //   return Container();
                          // } else {
                          return Container(
                            height: height * 0.3,
                            width: width * 0.5,
                            child: Image(
                              image: FileImage(File(
                                  snapshot.data!.docs[index]["postimages"][0])),
                              fit: BoxFit.fill,
                            ),
                          );
                        }
                        // },
                        );
                  }),
            )
          ],
        ));
  }

  void logoutuser() async {
    await FirebaseAuth.instance.signOut();
    _listener = FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => MyHome()));
      } else {
        print('User is signed in!');
      }
    });
  }
}
