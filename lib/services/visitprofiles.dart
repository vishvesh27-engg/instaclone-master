import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaclone/screens/homepage.dart';
import 'package:instaclone/widgets/videoprofile.dart';
import 'package:instaclone/services/globals.dart' as global;

class VisitProfiles extends StatefulWidget {
  String visitid;
  VisitProfiles(this.visitid);

  @override
  _VisitProfilesState createState() => _VisitProfilesState();
}

class _VisitProfilesState extends State<VisitProfiles> {
  String? visitorid;
  int? posts;
  int? followers;
  int? following;
  String username = "";
  String? profilepic;
  String? name;
  String? bio;
  List<String> followernames = [];
  bool hasinitialised = false;
  bool aldreadyfollowing = false;
  @override
  void initState() {
    super.initState();
    visitorid = widget.visitid;
    getinformationofvisitor();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    CollectionReference ref = FirebaseFirestore.instance
        .collection('posts')
        .doc(visitorid)
        .collection('userposts');
    return hasinitialised
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              leading: Container(),
              leadingWidth: 0,
              title: Row(children: [
                Text(
                  username,
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
                        padding: EdgeInsets.fromLTRB(height / 200, height / 70,
                            height / 400, height / 168),
                        child: CircleAvatar(
                          radius: height * 0.06,
                          backgroundImage: FileImage(File(profilepic!)),
                        ),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(
                                height / 20, height / 14, height / 20, 0),
                            child: Text(
                              "$posts",
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
                              "$followers",
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
                              "$following",
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
                          "$name",
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
                          "$bio",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ))),
                Row(
                  children: [
                    Container(
                      height: height * 0.08,
                      width: width * 0.4,
                      padding: EdgeInsets.fromLTRB(
                          height * 0.05, height * 0.05, 0, 0),
                      child: (!aldreadyfollowing)
                          ? ElevatedButton(
                              onPressed: () async {
                                followers = followers! + 1;

                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(visitorid)
                                    .update({
                                  "followers": followers,
                                  "followers_ids":
                                      FieldValue.arrayUnion([global.id])
                                });
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(global.id)
                                    .update({
                                  "following": FieldValue.increment(1),
                                  "following_ids":
                                      FieldValue.arrayUnion([visitorid])
                                });
                                setState(() {
                                  aldreadyfollowing = true;
                                });
                              },
                              child: Text('Follow'))
                          : ElevatedButton(
                              onPressed: () async {
                                followers = followers! - 1;

                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(visitorid)
                                    .update({
                                  "followers": followers,
                                  "followers_ids":
                                      FieldValue.arrayRemove([global.id])
                                });
                                await FirebaseFirestore.instance
                                    .collection("users")
                                    .doc(global.id)
                                    .update({
                                  "following": FieldValue.increment(-1),
                                  "following_ids":
                                      FieldValue.arrayRemove([visitorid])
                                });
                                setState(() {
                                  aldreadyfollowing = false;
                                });
                              },
                              child: Text('Unfollow')),
                    ),
                    SizedBox(width: 40),
                    Container(
                      height: height * 0.08,
                      width: width * 0.4,
                      padding: EdgeInsets.fromLTRB(
                          0, height * 0.05, height * 0.05, 0),
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {},
                        child: Text(
                          "message",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                // Container(
                //     height: height * 0.1,
                //     width: width * 0.9,
                //     padding: EdgeInsets.fromLTRB(0, height * 0.05, 0, 0),
                //     child: ElevatedButton(
                //         onPressed: () {
                //           Navigator.pushNamed(context, Editprofile.id);
                //         },
                //         child: Text('Edit Profile'))),
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
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing: 5.0,
                            mainAxisSpacing: 5.0,
                          ),
                          itemCount:
                              snapshot.hasData ? snapshot.data!.docs.length : 0,
                          itemBuilder: (context, index) {
                            var extension = snapshot
                                .data!.docs[index]["postimages"][0]
                                .substring(snapshot.data!
                                        .docs[index]["postimages"][0].length -
                                    3);
                            if (extension == "mp4") {
                              return videoprofile(
                                  snapshot.data!.docs[index]["postimages"][0]);
                            } else {
                              return Container(
                                height: height * 0.3,
                                width: width * 0.5,
                                child: Image(
                                  image: FileImage(File(snapshot
                                      .data!.docs[index]["postimages"][0])),
                                  fit: BoxFit.fill,
                                ),
                              );
                            }
                          },
                        );
                      }),
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.search), label: 'search'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.add), label: 'addposts'),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: EdgeInsets.fromLTRB(
                        height / 400, height / 168, height / 400, height / 168),
                    child: CircleAvatar(
                      radius: height * 0.015,
                      backgroundImage: FileImage(File(global.profilepic)),
                    ),
                  ),
                  label: 'search',
                ),
              ],
              selectedItemColor: Colors.blue,
              elevation: 5.0,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              onTap: (index) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => HomePage(index)));
              },
            ),
          )
        : SizedBox(height: 40, child: CircularProgressIndicator());
  }

  void getinformationofvisitor() async {
    var visitor = await FirebaseFirestore.instance
        .collection("users")
        .doc(visitorid)
        .get();
    print("oblak 1");
    posts = visitor["posts"];
    followers = visitor["followers"];
    following = visitor["following"];
    username = visitor["username"];
    name = visitor["name"];
    bio = visitor["bio"];
    profilepic = visitor["profile_pic"];
    print("oblak 2");
    followernames = List.castFrom(visitor["followers_ids"]);
    print("oblak 3");
    followernames.contains(global.id);
    print("oblak 4");
    setState(() {
      aldreadyfollowing = followernames.contains(global.id);
      hasinitialised = true;
    });
    print("oblak 5");
  }
}
