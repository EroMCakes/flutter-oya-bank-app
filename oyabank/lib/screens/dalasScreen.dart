import 'package:flutter/material.dart';

import 'startScreen.dart';

class dallasScreen extends StatefulWidget {
  @override
  _dallasScreenState createState() => _dallasScreenState();
}

class _dallasScreenState extends State<dallasScreen> {
  final inputCodeController = TextEditingController();

  void _submitCode() {
    if (inputCodeController.text.isEmpty)
      return;
    else if (inputCodeController.text == "24062010") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => startScreen()));
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
            'Time Zone',
            style: TextStyle(
              color: Colors.amber,
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
                    hintText: '********',
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: inputCodeController,
                  onSubmitted: (_) => _submitCode,
                ),
              ),
              OutlinedButton(
                child: Icon(Icons.check),
                onPressed: () {},
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
