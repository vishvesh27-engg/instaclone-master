import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:instaclone/screens/profilepage.dart';
import 'package:instaclone/widgets/videoprofile.dart';
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

class SearchPage extends StatefulWidget {
  static const String id = '/search';
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  CollectionReference ref = FirebaseFirestore.instance.collection('posts');

  @override
  Widget build(BuildContext context) {
    var aheight = AppBar().preferredSize.height;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final TextEditingController searchcontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        centerTitle: false,
        leadingWidth: 0,
        leading: Container(),
        title: GestureDetector(
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
            decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
            // child: TextField(
            //   controller: searchcontroller,
            //   style: TextStyle(fontSize: 20),
            //   decoration: InputDecoration(
            //       suffixIcon: Icon(Icons.search),
            //       fillColor: Colors.white,
            //       focusColor: Colors.white,
            //       hoverColor: Colors.white,
            //       border: OutlineInputBorder(
            //         borderSide:
            //             const BorderSide(color: Colors.white, width: 0.0),
            //       ),
            //       labelStyle: new TextStyle(color: Colors.white),
            //       hintText: 'Search'),
          ),
        ),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("users")
            .where("posts", isGreaterThan: 0)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5.0,
              mainAxisSpacing: 5.0,
            ),
            itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
            itemBuilder: (context, index) {
              return StreamBuilder(
                stream: ref
                    .doc(snapshot.data!.docs[index]["id"])
                    .collection("userposts")
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  } else {
                    return Container(
                      height: height * 0.3,
                      width: width * 0.5,
                      child: Image(
                        image: FileImage(
                            File(snapshot.data!.docs[0]["postimages"][0])),
                        fit: BoxFit.fill,
                      ),
                    );
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}

//   Widget build(BuildContext context) {
//     var aheight = AppBar().preferredSize.height;
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         appBar: AppBar(
//             backgroundColor: Colors.white54,
//             centerTitle: false,
//             leadingWidth: 0,
//             leading: Container(),
//             title: Container(
//               height: aheight * 0.9,
//               width: width * 0.8,
//               child: TextField(
//                 style: TextStyle(fontSize: 20),
//                 decoration: InputDecoration(
//                     fillColor: Colors.white,
//                     focusColor: Colors.white,
//                     hoverColor: Colors.white,
//                     prefixIcon: Icon(Icons.search),
//                     border: OutlineInputBorder(
//                       borderSide:
//                           const BorderSide(color: Colors.white, width: 0.0),
//                     ),
//                     labelStyle: new TextStyle(color: Colors.white),
//                     hintText: 'Search'),
//               ),
//             ))
//         // body: StreamBuilder(
//         //     stream: ref.snapshots(),
//         //     builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         //       return GridView.builder(
//         //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//         //           crossAxisCount: 3,
//         //           crossAxisSpacing: 5.0,
//         //           mainAxisSpacing: 5.0,
//         //         ),
//         //         itemCount: snapshot.hasData ? snapshot.data!.docs.length : 0,
//         //         itemBuilder: (context, index) {
//         //           extension = snapshot.data!.docs["postimages"][0]
//         //               .substring(
//         //                   snapshot.data!.docs[index]["postimages"][0].length -
//         //                       3);
//         //           if (extension == "mp4") {
//         //             return videoprofile(
//         //                 snapshot.data!.docs[index]["postimages"][0]);
//         //           } else {
//         //             return Container(
//         //               height: height * 0.3,
//         //               width: width * 0.5,
//         //               child: Image(
//         //                 image: FileImage(
//         //                     File(snapshot.data!.docs[index]["postimages"][0])),
//         //                 fit: BoxFit.fill,
//         //               ),
//         //             );
//         //           }
//         //         },
//         //       );
//         //     }));
//         ,
//         body: StreamBuilder(
//             stream: ref.snapshots(),
//             builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//               return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 5.0,
//                     mainAxisSpacing: 5.0,
//                   ),
//                   itemCount: userswhohavepost.length,
//                   itemBuilder: (context, index) {
//                     return StreamBuilder(
//                         stream: ref
//                             .doc(userswhohavepost[index])
//                             .collection("userposts")
//                             .snapshots(),
//                         builder:
//                             (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                           if (!snapshot.hasData) {
//                             return CircularProgressIndicator();
//                           } else {
//                             return Container(
//                               height: height * 0.3,
//                               width: width * 0.5,
//                               child: Image(
//                                 image: FileImage(File(
//                                     snapshot.data!.docs[0]["postimages"][0])),
//                                 fit: BoxFit.fill,
//                               ),
//                             );
//                           }
//                         });
//                   });
//               // CollectionReference reference = FirebaseFirestore.instance.collection('posts').doc(global.users[index]).collection("userposts");
//               // return StreamBuilder(stream: ,builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){});
//             }));
//     // body: GridView.builder(
//     //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     //       crossAxisCount: 5,
//     //       crossAxisSpacing: 5.0,
//     //       mainAxisSpacing: 5.0,
//     //     ),
//     //     itemCount: global.users.length,
//     //     itemBuilder: (context, index) {
//     //       // getresult(index);
//     //       // if (extension == "mp4") {
//     //       //   return Container();
//     //       // } else {
//     //       return Container(
//     //         height: height * 0.3,
//     //         width: width * 0.5,
//     //         child: Image(
//     //           // image: FileImage(File(getpath(index))),
//     //           fit: BoxFit.fill,
//     //         ),
//     //       );
//     //     }
//     //     // },
//     //     ));
//     // padding: EdgeInsets.fromLTRB(
//     //     height / 300, height / 200, height / 300, 0),
//     // scrollDirection: Axis.vertical,
//     // crossAxisCount: 3,
//     // mainAxisSpacing: height / 300,
//     // crossAxisSpacing: height / 300,
//     // );
//   }

//   // void getresult(int index) async {
//   //   print("get result is running");
//   //   res[index] = (await FirebaseFirestore.instance
//   //           .collection("posts")
//   //           .doc(global.users[index])
//   //           .collection("userposts")
//   //           .get())
//   //       .docs;

//   //   print(res);
//   //   setState(() {});
//   // }
// //   Future<String> getpath(int index) async{
// //   res[index] = (await FirebaseFirestore.instance
// //             .collection("posts")
// //             .doc(global.users[index])
// //             .collection("userposts")
// //             .get())
// //         .docs;
// // }
// }
