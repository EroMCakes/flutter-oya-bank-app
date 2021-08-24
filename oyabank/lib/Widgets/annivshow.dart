import 'package:flutter/material.dart';

class annivShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.transparent,
        child: new Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
          body: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Image.asset(
                'assets/images/anniv.jpg',
                fit: BoxFit.contain,
              ),
            ),
          ),
        ));
  }
}
