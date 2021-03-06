import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/utils/stream_subscriber_mixin.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/homepage.dart';
import 'login.dart';
import 'myhome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instaclone/services/globals.dart' as global;

class SignUpPage extends StatefulWidget {
  static const String id = '/sign';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late String _email, _password, _confirm, _username;
  final auth = FirebaseAuth.instance;
  final store = FirebaseFirestore.instance.collection('users');

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: Stack(children: [
              Positioned(
                  top: height * 0.05,
                  height: width * 0.05,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => MyHome()));
                    },
                  )),
              Positioned(
                  top: height * 0.1,
                  left: width * 0.2,
                  height: height * 0.65,
                  width: width * 0.6,
                  child: ListView(children: [
                    Container(
                      height: height * 0.1,
                      width: width * 0.4,
                      child: Image(
                        image: AssetImage("assets/instagramlogo.png"),
                        height: height * 0.1,
                        width: width * 0.4,
                      ),
                    ),
                    Container(
                      height: height * 0.12,
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.06,
                          width * 0.02, height * 0.01),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Username'),
                        onChanged: (value) {
                          _username = value.trim();
                        },
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.01,
                          width * 0.02, height * 0.01),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'Email Id'),
                        onChanged: (value) {
                          _email = value.trim();
                        },
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.01,
                          width * 0.02, height * 0.01),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(), hintText: 'password'),
                        onChanged: (value) {
                          _confirm = value.trim();
                        },
                      ),
                    ),
                    Container(
                      height: height * 0.07,
                      padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.01,
                          width * 0.02, height * 0.01),
                      child: TextField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'confirm password'),
                        onChanged: (value) {
                          _password = value.trim();
                        },
                      ),
                    ),
                    Container(
                        height: height * 0.12,
                        padding: EdgeInsets.fromLTRB(
                            0, height * 0.06, 0, height * 0.01),
                        child: ElevatedButton(
                            child: Text('Sign Up'),
                            onPressed: () {
                              if (_password == _confirm) {
                                handlesignup();
                              } else {
                                Navigator.pushNamed(context, SignUpPage.id);
                              }
                            }))
                  ])),
              Positioned(
                  top: height * 0.75,
                  width: width,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                            "_____________________________OR______________________________",
                            style: TextStyle(color: Colors.grey)))
                  ])),
              Positioned(
                  top: height * 0.77,
                  left: width * 0.3,
                  child: Row(children: [
                    Align(
                        child: Text("have an account?",
                            style: TextStyle(color: Colors.grey))),
                    InkWell(
                      child:
                          Text('Log in', style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        Navigator.pushNamed(context, LoginPage.id);
                      },
                    )
                  ])),
              Positioned(
                  top: height * 0.92,
                  width: width,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(
                            "_______________________________________________________________",
                            style: TextStyle(color: Colors.grey)))
                  ])),
              Positioned(
                  top: height * 0.94,
                  width: width,
                  child: Column(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text("Instagram or Facebook",
                            style: TextStyle(color: Colors.grey)))
                  ]))
            ])));
  }

  handlesignup() async {
    await auth.createUserWithEmailAndPassword(
        email: _email, password: _password);

    final User = (await auth.signInWithEmailAndPassword(
            email: _email, password: _password))
        .user;
    if (User != null) {
      FirebaseFirestore.instance.collection('users').doc(User.uid).set({
        "id": User.uid,
        "username": _username,
        "email": _email,
        "bio": "hey there i am using instagram",
        "name": _username,
        "profile_pic": 'assets/default.jpg',
        "created_at": DateTime.now().millisecondsSinceEpoch,
        "followers": 0,
        "following": 0,
        "posts": 0,
        "following_ids": <String>[],
        "followers_ids": <String>[],
      });
      global.id = User.uid;
      global.username = _username;
      global.profilepic = 'assets/default.jpg';
      global.name = _username;
      global.bio = "hey there i am using instagram";
      global.email = _email;
      global.posts = 0;
      global.followers = 0;
      global.following = 0;
      Navigator.pushNamed(context, HomePage.id);
    }
  }
}
