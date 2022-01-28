import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/chatpage.dart';
import 'package:instaclone/screens/homepage.dart';
import 'package:instaclone/services/globals.dart' as global;

class datasearch extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  String reos = "";
  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        onPressed: () {
          close(context, reos);
        },
        icon: AnimatedIcon(
            icon: AnimatedIcons.menu_arrow, progress: transitionAnimation));
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    reos = query;
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.length == 0 || query.length == 1) {
      return Container();
    } else {
      var strSearch = query;
      var strlength = strSearch.length;
      var strFrontCode = strSearch.substring(0, strlength - 1);
      var strEndCode = strSearch.substring(strlength - 1, strSearch.length);

      var startcode = strSearch;
      var endcode =
          strFrontCode + String.fromCharCode(strEndCode.codeUnitAt(0) + 1);
      // TODO: implement buildSuggestions
      return StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .where('username', isGreaterThanOrEqualTo: startcode)
              .where('username', isLessThan: endcode)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  chat_page(docs: snapshot.data!.docs[index])));
                    },
                    leading: CircleAvatar(
                      backgroundImage: FileImage(
                          File(snapshot.data!.docs[index]["profile_pic"])),
                    ),
                    title: Text(snapshot.data!.docs[index]["username"]),
                  );
                },
              );
            }
          });
    }
  }
}

class DmPage extends StatefulWidget {
  static const String id = '/dm';
  @override
  _DmPageState createState() => _DmPageState();
}

class _DmPageState extends State<DmPage> {
  List<String> following = [];
  bool hasinitialised = false;
  @override
  void initState() {
    super.initState();
    getfollowing().whenComplete(() {
      setState(() {
        hasinitialised = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var aheight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    buildItem(doc) {
      return (doc['id'] != global.id)
          ? GestureDetector(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => chat_page(docs: doc)));
              },
              child: ListTile(
                  leading: Padding(
                    padding: EdgeInsets.fromLTRB(
                        height / 400, height / 168, height / 400, height / 168),
                    child: CircleAvatar(
                      radius: height * 0.035,
                      backgroundImage: FileImage(File(doc["profile_pic"])),
                    ),
                  ),
                  title: Container(
                      height: height * 0.035,
                      width: width * 0.6,
                      padding:
                          EdgeInsets.fromLTRB(height / 100, height / 100, 0, 0),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Text('${doc["username"]}',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      )),
                  trailing: Container(
                      width: width * 0.2,
                      padding: EdgeInsets.fromLTRB(0, 0, height / 100, 0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                            onPressed: () {}, icon: Icon(Icons.camera_alt)),
                      ))))
          : Container();
    }

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
              "${global.username}",
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
        body: ListView(scrollDirection: Axis.vertical, children: [
          Container(
              height: aheight * 1.1,
              width: width,
              padding: EdgeInsets.fromLTRB(
                  width * 0.05, aheight * 0.2, width * 0.05, aheight * 0.2),
              child: GestureDetector(
                onTap: () {
                  showSearch(context: context, delegate: datasearch());
                },
                child: Container(
                  height: aheight * 0.9,
                  width: width,
                  child: Row(
                    children: [
                      Spacer(),
                      Text(
                        "SEARCH",
                        style: TextStyle(color: Colors.black),
                      ),
                      Spacer(),
                      Icon(
                        Icons.search,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.blue)),
                ),
                // child: TextField(
                //   maxLines: 1,
                //   style: TextStyle(fontSize: 20),
                //   decoration: InputDecoration(
                //     fillColor: Colors.white,
                //     focusColor: Colors.white,
                //     hoverColor: Colors.white,
                //     prefixIcon: Icon(Icons.search),
                //     border: OutlineInputBorder(
                //       borderSide:
                //           const BorderSide(color: Colors.white, width: 0.0),
                //     ),
                //     labelStyle: new TextStyle(color: Colors.white),
                //     hintText: 'Search',
                //     hintStyle: TextStyle(
                //       height: 2.8,
                //     ),
                //   ),
                // ),
              )),
          hasinitialised
              ? Container(
                  height: height / 1.2,
                  child: ListView.builder(
                      itemCount: following.length,
                      itemBuilder: (context, index) {
                        print("no of following $following");
                        return FutureBuilder(
                            future: FirebaseFirestore.instance
                                .collection("users")
                                .doc(following[index])
                                .get(),
                            builder: (context,
                                AsyncSnapshot<DocumentSnapshot> snapshot1) {
                              if (snapshot1.hasData) {
                                return buildItem(snapshot1.data);
                              } else {
                                return Container();
                              }
                            });
                      }),
                )
              : Container(),
          // StreamBuilder<QuerySnapshot>(
          //     stream:
          //         FirebaseFirestore.instance.collection('users').snapshots(),
          //     builder: (context, snapshot) {
          //       if (snapshot.hasData) {
          //         return Container(
          //           height: height / 1.2,
          //           child: ListView.builder(
          //             itemBuilder: (listContext, index) =>
          //                 buildItem(snapshot.data!.docs[index]),
          //             itemCount: snapshot.data!.docs.length,
          //           ),
          //         );
          //       } else {
          //         return Container();
          //       }
          //     })
        ]));
  }

  Future<bool> getfollowing() async {
    var result = await FirebaseFirestore.instance
        .collection("users")
        .doc(global.id)
        .get();
    following = List<String>.from(result["following_ids"]);

    return true;
  }
}
