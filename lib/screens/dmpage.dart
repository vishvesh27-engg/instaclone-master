import 'package:flutter/material.dart';
import 'package:instaclone/screens/homepage.dart';

class DmPage extends StatefulWidget {
  static const String id = '/dm';
  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  @override
  Widget build(BuildContext context) {
    var aheight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pushNamed(context, HomePage.id);
              },
              color: Colors.black),
          title: Row(children: [
            Text(
              "Soul_21",
              style: TextStyle(color: Colors.black),
            ),
            Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            )
          ]),
          actions: [
            IconButton(
                onPressed: () {}, icon: Icon(Icons.add), color: Colors.black)
          ],
        ),
        body: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: aheight * 1.1,
              width: width,
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, aheight * 0.2, width * 0.05, aheight * 0.2),
              child: TextField(
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.white, width: 0.0),
                    ),
                    labelStyle: new TextStyle(color: Colors.white),
                    hintText: 'Search'),
              ),
            ),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/storyimage2.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('idontexist',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('hey man how r u??!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/storyimage3.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('peace',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('some ppl just get 4 days',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/storyimage4.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('getlost',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('you still here??!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/storyimage5.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('sunkissed',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('jealous of the sun huh?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/storyimage6.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('reynakd',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('see you in the valo lobby',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/storyimage7.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('liam27',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('r u busy right now??!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage1.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('nallavan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('oru game valo??!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage2.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('vallavan',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('10 mins loading screen la iruken!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage3.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('pheonix',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('let me show you how the boss does it',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage6.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('astra',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('i am on a higher plane!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage7.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('kathir',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('sollitale kelambu',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage8.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('jett',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('sova!! whats the plan?',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage9.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('omen',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('i am the beginning and the end',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
            Container(
                child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(
                      height / 400, height / 168, height / 400, height / 168),
                  child: CircleAvatar(
                    radius: height * 0.035,
                    backgroundImage: AssetImage("assets/postimage10.jpg"),
                  ),
                ),
                Column(
                  children: [
                    Container(
                        height: height * 0.035,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 100, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('kay/0',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        )),
                    Container(
                        height: height * 0.03,
                        width: width * 0.6,
                        padding: EdgeInsets.fromLTRB(
                            height / 100, height / 200, 0, 0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text('kill all your opponents!!',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontStyle: FontStyle.italic)),
                        )),
                  ],
                ),
                Container(
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () {}, icon: Icon(Icons.camera_alt)),
                    ))
              ],
            )),
          ],
        ));
  }
}
