import 'package:flutter/material.dart';
import 'login.dart';
import 'signup.dart';

class MyHome extends StatefulWidget {
  static const String id = '/1';
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'instagram',
        home: Scaffold(
            body: Stack(children: [
          Positioned(
            top: height * 0.25,
            left: width * 0.3,
            child: Image(
              image: AssetImage("assets/instagramlogo.png"),
              height: height * 0.15,
              width: width * 0.4,
            ),
          ),
          Positioned(
              top: height * 0.5,
              left: width * 0.2,
              width: width * 0.6,
              child: ElevatedButton(
                  child: Text('Log in'),
                  onPressed: () {
                    Navigator.pushNamed(context, LoginPage.id);
                  })),
          Positioned(
              top: height * 0.57,
              left: width * 0.2,
              width: width * 0.6,
              child: ElevatedButton(
                child: Text(
                  'Sign Up',
                  style: TextStyle(color: Colors.blue),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignUpPage.id);
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.white)),
              )),
        ])));
  }
}
