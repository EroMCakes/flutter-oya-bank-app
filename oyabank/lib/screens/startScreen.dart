import 'package:flutter/material.dart';
import 'package:oyabank/screens/birthday.dart';

class startScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/vault.jpg'),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text(
            'Bienvenue chez OYA Bank',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: OutlinedButton(
            child: Text(
              'Start',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => birthdayScreen()));
            },
            style: OutlinedButton.styleFrom(
              side: BorderSide(
                width: 2,
                color: Colors.amber,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
