import 'package:flutter/material.dart';
import 'package:instaclone/screens/dmpage.dart';
import 'package:instaclone/screens/editprofile.dart';
import 'package:instaclone/screens/homepage.dart';
import 'package:instaclone/screens/profilepage.dart';
import 'screens/myhome.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/scrollpage.dart';
import 'screens/searchpage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _fbapp = Firebase.initializeApp();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (FutureBuilder(
        future: _fbapp,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print(snapshot.error);
            return Text('Error');
          } else if (snapshot.hasData) {
            return MaterialApp(
              initialRoute: MyHome.id,
              routes: {
                MyHome.id: (context) => MyHome(),
                LoginPage.id: (context) => LoginPage(),
                SignUpPage.id: (context) => SignUpPage(),
                ScrollPage.id: (context) => ScrollPage(),
                SearchPage.id: (context) => SearchPage(),
                HomePage.id: (context) => HomePage(),
                ProfilePage.id: (context) => ProfilePage(),
                DmPage.id: (context) => DmPage(),
                Editprofile.id: (context) => Editprofile()
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        }));
  }
}
