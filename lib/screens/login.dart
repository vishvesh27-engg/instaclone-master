//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'myhome.dart';
import 'signup.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static const String id = '/log';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String _email, _password;
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Stack(
            children: [
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
                  top: height * 0.2,
                  left: width * 0.2,
                  height: height * 0.65,
                  width: width * 0.6,
                  child: ListView(
                    children: [
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
                        padding: EdgeInsets.fromLTRB(width * 0.02,
                            height * 0.06, width * 0.02, height * 0.01),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(), hintText: 'email'),
                          onChanged: (value) {
                            _email = value.trim();
                          },
                        ),
                      ),
                      Container(
                        height: height * 0.07,
                        padding: EdgeInsets.fromLTRB(width * 0.02,
                            height * 0.01, width * 0.02, height * 0.01),
                        child: TextField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'password'),
                          onChanged: (value) {
                            _password = value.trim();
                          },
                        ),
                      ),
                      Container(
                          width: width * 0.6,
                          padding: EdgeInsets.fromLTRB(
                              0, height * 0.01, 0, height * 0.01),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: Text("forgot password?",
                                    style: TextStyle(color: Colors.blue)),
                              )
                            ],
                          )),
                      Container(
                          height: height * 0.12,
                          padding: EdgeInsets.fromLTRB(
                              0, height * 0.06, 0, height * 0.01),
                          child: ElevatedButton(
                              child: Text('Log in'),
                              onPressed: () async {
                                handlelogin();
                                try {
                                  await auth.signInWithEmailAndPassword(
                                      email: _email, password: _password);
                                  Navigator.pushNamed(context, HomePage.id);
                                  // ignore: unused_catch_clause
                                } on FirebaseAuthException catch (e) {
                                  Navigator.pushNamed(context, LoginPage.id);
                                }
                              }))
                    ],
                  )),
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
                        child: Text("Don't have an account?",
                            style: TextStyle(color: Colors.grey))),
                    InkWell(
                      child:
                          Text('Sign Up', style: TextStyle(color: Colors.blue)),
                      onTap: () {
                        Navigator.pushNamed(context, SignUpPage.id);
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
                  ])),
            ],
          ),
        ));
  }

  handlelogin() async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      final firebaseuser = (await auth.signInWithEmailAndPassword(
              email: _email, password: _password))
          .user;
      if (firebaseuser != null) {
        final result = (await FirebaseFirestore.instance
                .collection('users')
                .where('id', isEqualTo: firebaseuser.uid)
                .get())
            .docs;
        sharedPreferences.setString("id", result[0]["id"]);
        sharedPreferences.setString("name", result[0]["name"]);
        sharedPreferences.setString("email", result[0]["email"]);
        sharedPreferences.setString("profile_pic", result[0]["profile_pic"]);
        Navigator.pushNamed(context, HomePage.id);
      }

      // ignore: unused_catch_clause
    } on FirebaseAuthException catch (e) {
      Navigator.pushNamed(context, LoginPage.id);
    }
  }
}
