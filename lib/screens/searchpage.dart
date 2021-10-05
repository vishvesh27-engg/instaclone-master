import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  static const String id = '/search';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    var aheight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white54,
            centerTitle: false,
            leadingWidth: 0,
            leading: Container(),
            title: Container(
              height: aheight * 0.9,
              width: width * 0.8,
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
            )),
        body: GridView.count(
            padding: EdgeInsets.fromLTRB(
                height / 300, height / 200, height / 300, 0),
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
            ]));
  }
}
