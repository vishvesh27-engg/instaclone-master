import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/dmpage.dart';
import 'package:instaclone/services/displaypost.dart';
import 'package:instaclone/services/globals.dart' as global;

class PageScroll extends StatefulWidget {
  const PageScroll({Key? key}) : super(key: key);

  @override
  _PageScrollState createState() => _PageScrollState();
}

class _PageScrollState extends State<PageScroll> {
  List<String> following = [];
  late Stream<String> followingstream;
  bool hasinitialised = false;
  @override
  void initState() {
    super.initState();
    getfollowing();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var aheight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.white,
                leading: IconButton(
                  icon: Icon(Icons.camera_alt),
                  color: Colors.black,
                  tooltip: 'Click a picture',
                  onPressed: () {},
                ),
                title: Padding(
                    padding: EdgeInsets.fromLTRB(aheight * 0.2, aheight * 0.1,
                        aheight * 0.2, aheight * 0.1),
                    child: Container(
                        height: aheight * 0.8,
                        width: width * 0.6,
                        child: Image(
                          image: AssetImage("assets/instagramlogo.png"),
                          fit: BoxFit.scaleDown,
                        ))),
                actions: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(
                          0, aheight * 0.25, aheight * 0.1, aheight * 0.3),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, DmPage.id);
                          },
                          child: Image(
                              image: AssetImage("assets/dmlogo.png"),
                              height: aheight * 0.6)))
                ]),
            // body: StreamBuilder(
            //   stream:
            //       FirebaseFirestore.instance.collection("users").doc().snapshots(),
            //   builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            //     return Container();
            //   },
            // )));
            body: hasinitialised
                ? ListView.builder(
                    itemCount: following.length,
                    itemBuilder: (context, index) {
                      return FutureBuilder(
                          future: FirebaseFirestore.instance
                              .collection("users")
                              .doc(following[index])
                              .get(),
                          builder: (context,
                              AsyncSnapshot<DocumentSnapshot> snapshot1) {
                            return StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("posts")
                                  .doc(following[index])
                                  .collection("userposts")
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot2) {
                                return DisplayPost(
                                    name: snapshot1.data?.get("username"),
                                    dp: snapshot1.data?.get("profile_pic"),
                                    postimages: snapshot2.data!.docs[0]
                                        ["postimages"],
                                    caption: snapshot2.data!.docs[0]
                                        ["caption"]);
                              },
                            );
                          });
                    })
                : Container()));
    // bottomNavigationBar: BottomNavigationBar(
    //   showUnselectedLabels: false,
    //   showSelectedLabels: false,
    //   items: [
    //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
    //     BottomNavigationBarItem(
    //         icon: Icon(Icons.search), label: 'search'),
    //     BottomNavigationBarItem(
    //       icon: Padding(
    //         padding: EdgeInsets.fromLTRB(
    //             height / 400, height / 168, height / 400, height / 168),
    //         child: CircleAvatar(
    //           radius: height * 0.015,
    //           backgroundImage: AssetImage("assets/storyimage1.jpg"),
    //         ),
    //       ),
    //       label: 'search',
    //     ),
    //   ],
    // ),
  }

  void getfollowing() async {
    var result = await FirebaseFirestore.instance
        .collection("users")
        .doc(global.id)
        .get();
    following = List<String>.from(result["following_ids"]);
    followingstream = Stream.fromIterable(following);
    setState(() {
      hasinitialised = true;
    });
  }
}
