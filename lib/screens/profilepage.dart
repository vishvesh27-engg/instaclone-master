import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const String id = '/profile';
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Container(),
          leadingWidth: 0,
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
                      backgroundImage: AssetImage("assets/storyimage1.jpg"),
                    ),
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(
                            height / 20, height / 14, height / 20, 0),
                        child: Text(
                          "54",
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
                          "834",
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
                          "162",
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
                      "Jacob West",
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
                      "whatever let's you sleep at night",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ))),
            Container(
                height: height * 0.1,
                width: width * 0.9,
                padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
                child: ElevatedButton(
                    onPressed: () {}, child: Text('Edit Profile'))),
            Container(
                padding: EdgeInsets.fromLTRB(
                    height / 300, height / 20, height / 300, 0),
                height: height * 0.5,
                width: width,
                child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 3,
                    mainAxisSpacing: height / 300,
                    crossAxisSpacing: height / 300,
                    children: [
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/storyimage1.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/storyimage2.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/storyimage3.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage4.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage5.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/storyimage6.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/storyimage7.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage1.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage2.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage3.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage4.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage5.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage6.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage7.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage8.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        height: height * 0.3,
                        width: width * 0.5,
                        child: Image(
                          image: AssetImage("assets/postimage9.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ]))
          ],
        ));
  }
}
