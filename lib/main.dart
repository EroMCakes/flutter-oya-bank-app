import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:oyabank/screens/dalasScreen.dart';

import './screens/birthday.dart';
import './screens/codeAnniv.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => startScreen(),
        '/birthdayRiddle': (context) => birthdayScreen(),
        '/dallasRiddle': (context) => dallasScreen(),
        // ''
      },
    );
  }
}
