import 'package:flutter/material.dart';

import 'dalasScreen.dart';

class birthdayScreen extends StatefulWidget {
  @override
  _birthdayScreenState createState() => _birthdayScreenState();
}

class _birthdayScreenState extends State<birthdayScreen> {
  final inputCodeController = TextEditingController();

  void _submitCode() {
    if (inputCodeController.text.isEmpty)
      return;
    else if (inputCodeController.text == "24062010") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => dallasScreen()));
    } else {
      inputCodeController.text == "";
    }
  }

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
            'Ma fille bien aimée',
            style: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Container(
                height: 200,
              ),
              Container(
                width: 200,
                height: 35,
                color: Colors.amber[200],
                margin: EdgeInsets.all(25),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: '********',
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: inputCodeController,
                  onSubmitted: (_) => _submitCode(),
                ),
              ),
              OutlinedButton(
                child: Icon(Icons.check),
                onPressed: _submitCode,
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    width: 2,
                    color: Colors.amber,
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
