import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instaclone/screens/homepage.dart';
import 'package:instaclone/screens/profilepage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as Path;
import 'package:instaclone/services/globals.dart' as global;

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);
  static const String id = '/ep';
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  File? image;
  var email_controller = TextEditingController(),
      name_controller = TextEditingController(),
      username_controller = TextEditingController(),
      bio_controller = TextEditingController();
  String _username = "", _email = "", _name = "", _bio = "";
  String? _profilepic;
  @override
  void initState() {
    getuserinfo();
    // TODO: implement initState
    super.initState();
  }

  getuserinfo() {
    username_controller = TextEditingController(text: global.username);
    name_controller = TextEditingController(text: global.name);
    bio_controller = TextEditingController(text: global.bio);
    email_controller = TextEditingController(text: global.email);
    _profilepic = global.profilepic;

    image = File(_profilepic!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: BackButton(onPressed: () {
            Navigator.pushNamed(context, ProfilePage.id);
          }),
          title: Text('Edit Profile'),
          actions: [
            IconButton(
                onPressed: () async {
                  await saveinfo();
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => HomePage(3)));
                },
                icon: Icon(Icons.save))
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(children: [
            Container(
                height: height / 5,
                child: Column(
                  children: [
                    Container(
                      height: height / 6,
                      width: width,
                      child: CircleAvatar(
                        radius: height * 0.06,
                        backgroundImage: (_profilepic == null)
                            ? AssetImage("assets/default.jpg")
                            : FileImage(image!) as ImageProvider,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        changephoto();
                      },
                      child: Padding(
                          padding: EdgeInsets.fromLTRB(0, height * 0.01, 0, 0),
                          child: Text(
                            'Change profile photo',
                            style: TextStyle(color: Colors.blue),
                          )),
                    )
                  ],
                )),
            Container(
              height: height / 8,
              width: width,
              child: Row(children: [
                Container(
                    height: height * 0.12,
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.065,
                        width * 0.02, height * 0.01),
                    child: Text('NAME:')),
                Container(
                    height: height * 0.1,
                    width: width * 0.75,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.03,
                        width * 0.02, height * 0.01),
                    child: TextField(
                      controller: name_controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'name'),
                      onChanged: (value) {
                        _name = value.trim();
                      },
                    )),
              ]),
            ),
            Container(
              height: height / 12,
              width: width,
              child: Row(children: [
                Container(
                    height: height * 0.12,
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.03,
                        width * 0.02, height * 0.01),
                    child: Text('USERNAME:')),
                Container(
                    height: height * 0.1,
                    width: width * 0.75,
                    padding:
                        EdgeInsets.fromLTRB(width * 0.02, 0, width * 0.02, 0),
                    child: TextField(
                      controller: username_controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'username'),
                      onChanged: (value) {
                        _username = value.trim();
                      },
                    )),
              ]),
            ),
            Container(
              height: height / 12,
              width: width,
              child: Row(children: [
                Container(
                    height: height * 0.12,
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.03,
                        width * 0.02, height * 0.01),
                    child: Text('BIO:')),
                Container(
                    height: height * 0.1,
                    width: width * 0.75,
                    padding:
                        EdgeInsets.fromLTRB(width * 0.02, 0, width * 0.02, 0),
                    child: TextField(
                      controller: bio_controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'bio'),
                      onChanged: (value) {
                        _bio = value.trim();
                      },
                    )),
              ]),
            ),
            Container(
              height: height / 12,
              width: width,
              child: Row(children: [
                Container(
                    height: height * 0.12,
                    width: width * 0.2,
                    padding: EdgeInsets.fromLTRB(width * 0.02, height * 0.03,
                        width * 0.02, height * 0.01),
                    child: Text('EMAIL:')),
                Container(
                    height: height * 0.1,
                    width: width * 0.75,
                    padding:
                        EdgeInsets.fromLTRB(width * 0.02, 0, width * 0.02, 0),
                    child: TextField(
                      controller: email_controller,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), hintText: 'email'),
                      onChanged: (value) {
                        _email = value.trim();
                      },
                    )),
              ]),
            )
          ]),
        ));
  }

  saveinfo() async {
    global.profilepic = _profilepic!;
    global.username = username_controller.text;
    global.name = name_controller.text;
    global.bio = bio_controller.text;
    global.email = email_controller.text;
    final id = global.id;
    final user =
        await FirebaseFirestore.instance.collection('users').doc(id).update({
      'username': username_controller.text,
      'name': name_controller.text,
      'bio': bio_controller.text,
      'email': email_controller.text,
      'profile_pic': _profilepic
    });
  }

  changephoto() {
    var height = MediaQuery.of(context).size.height;
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
            height: height / 8,
            child: ListView(children: [
              ListTile(
                leading: Icon(Icons.camera),
                title: Text('camera'),
                onTap: () {
                  Navigator.pop(context);
                  getimage(1);
                },
              ),
              ListTile(
                leading: Icon(Icons.photo),
                title: Text('gallery'),
                onTap: () {
                  Navigator.pop(context);
                  getimage(2);
                },
              ),
            ])));
  }

  getimage(int choice) async {
    final newimage;
    try {
      if (choice == 1) {
        newimage = await ImagePicker().pickImage(source: ImageSource.camera);
      } else {
        newimage = await ImagePicker().pickImage(source: ImageSource.gallery);
      }
      if (newimage == null) {
        return;
      } else {
        //final temp = File(newimage!.path);
        final imagepermanent = await saveimagepermanently(newimage.path);
        setState(() {
          image = imagepermanent;
        });
      }
    } on PlatformException catch (e) {
      print('failed to pick image $e');
    }
  }

  Future<File> saveimagepermanently(String imagepath) async {
    final Directory = await getApplicationDocumentsDirectory();
    final name = Path.basename(imagepath);
    final storedimage = File('${Directory.path}/$name');
    _profilepic = storedimage.path;
    File(imagepath).copy(storedimage.path);
    return File(storedimage.path);
  }
}
