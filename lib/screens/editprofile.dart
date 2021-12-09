import 'package:flutter/material.dart';
import 'package:instaclone/screens/profilepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Editprofile extends StatefulWidget {
  const Editprofile({Key? key}) : super(key: key);
  static const String id = '/ep';
  @override
  _EditprofileState createState() => _EditprofileState();
}

class _EditprofileState extends State<Editprofile> {
  var email_controller = TextEditingController(),
      name_controller = TextEditingController(),
      username_controller = TextEditingController(),
      bio_controller = TextEditingController();
  String _username = "", _email = "", _profilepic = "", _name = "", _bio = "";
  int _followers = -1, _following = -1, _posts = -1;
  @override
  void initState() {
    getuserinfo();
    // TODO: implement initState
    super.initState();
  }

  getuserinfo() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    username_controller =
        TextEditingController(text: sharedPreferences.getString('username'));
    name_controller =
        TextEditingController(text: sharedPreferences.getString('name'));
    bio_controller =
        TextEditingController(text: sharedPreferences.getString('bio'));
    email_controller =
        TextEditingController(text: sharedPreferences.getString('email'));
    _profilepic = sharedPreferences.getString('profile_pic')!;
    _followers = sharedPreferences.getInt('followers')!;
    _following = sharedPreferences.getInt('following')!;
    _posts = sharedPreferences.getInt('posts')!;
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
          actions: [IconButton(onPressed: saveinfo(), icon: Icon(Icons.save))],
        ),
        body: Column(children: [
          Container(
              height: height / 5,
              child: Column(
                children: [
                  Container(
                    height: height / 6,
                    width: width,
                    child: CircleAvatar(
                      radius: height * 0.06,
                      backgroundImage: AssetImage("assets/storyimage1.jpg"),
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
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.03, width * 0.02, height * 0.01),
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
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.03, width * 0.02, height * 0.01),
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
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.03, width * 0.02, height * 0.01),
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
                  padding: EdgeInsets.fromLTRB(
                      width * 0.02, height * 0.03, width * 0.02, height * 0.01),
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
        ]));
  }

  saveinfo() {}
  changephoto() {}
}
