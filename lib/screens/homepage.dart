import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instaclone/screens/pagescroll.dart';
import 'package:instaclone/screens/scrollpage.dart';
import 'package:instaclone/screens/searchpage.dart';
import 'package:instaclone/services/addposts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'profilepage.dart';
import 'package:instaclone/services/globals.dart' as global;

class HomePage extends StatefulWidget {
  int? pageindex;
  static const String id = '/hp';
  HomePage([this.pageindex = 0]);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPage = 0;
  String _url = '';
  @override
  void initState() {
    getprofilephoto();
    selectedPage = (widget.pageindex == null) ? 0 : widget.pageindex!;
    // TODO: implement initState
    super.initState();
  }

  getprofilephoto() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _url = sharedPreferences.getString('profile_pic')!;
  }

  final _pageOptions = [
    PageScroll(),
    SearchPage(),
    addposts(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        body: _pageOptions[selectedPage],
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: false,
          showSelectedLabels: false,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'search'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'addposts'),
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
          currentIndex: selectedPage,
          backgroundColor: Colors.white,
          onTap: (index) {
            setState(() {
              selectedPage = index;
            });
          },
        ));
  }
}
