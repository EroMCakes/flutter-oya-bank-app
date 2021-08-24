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
        body: Center(
          child: Column(
            children: <Widget>[
              Container(
                child: Text(
                  'OYA Bank',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
                margin: EdgeInsets.all(55),
                padding: EdgeInsets.only(bottom: 150, top: 30),
              ),
              Container(
                child: OutlinedButton(
                  child: Text(
                    'Start',
                    style: TextStyle(
                      fontSize: 50,
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => birthdayScreen()));
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
