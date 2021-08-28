import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyabank/screens/birthday.dart';
import 'package:oyabank/screens/codeAnniv.dart';

import './screens/startScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OYA Bank',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //Default brightness and colors for the APP
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,

        //Default font
        fontFamily: GoogleFonts.bitter().fontFamily,
      ),
      home: MyHomePage(),
      routes: {
        '/': (context) => startScreen(),
        '/birthdayRiddle': (context) => birthdayScreen(),
        '/birthdaySolution': (context) => codeAnniv(),
        ''
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return startScreen();
// This trailing comma makes auto-formatting nicer for build methods.
  }
}
