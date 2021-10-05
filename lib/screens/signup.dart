import 'package:flutter/material.dart';
import 'package:instaclone/screens/homepage.dart';
import 'login.dart';
import 'myhome.dart';

class SignUpPage extends StatefulWidget {
  static const String id = '/sign';
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: Stack(children: [
          Positioned(
              top: height * 0.05,
              height: width * 0.05,
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => MyHome()));
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
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.06, width * 0.02, height * 0.01),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Username'),
                  ),
                ),
                Container(
                  height: height * 0.07,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.01, width * 0.02, height * 0.01),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'Email Id'),
                  ),
                ),
                Container(
                  height: height * 0.07,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.01, width * 0.02, height * 0.01),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), hintText: 'password'),
                  ),
                ),
                Container(
                  height: height * 0.07,
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.01, width * 0.02, height * 0.01),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'confirm password'),
                  ),
                ),
                Container(
                    height: height * 0.12,
                    padding:
                        EdgeInsets.fromLTRB(0, height * 0.06, 0, height * 0.01),
                    child: ElevatedButton(
                        child: Text('Sign Up'),
                        onPressed: () {
                          Navigator.pushNamed(context, HomePage.id);
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
                  child: Text('Log in', style: TextStyle(color: Colors.blue)),
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
}
