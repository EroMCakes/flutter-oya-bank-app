import 'package:flutter/material.dart';

import 'startScreen.dart';

class dallasScreen extends StatefulWidget {
  @override
  _dallasScreenState createState() => _dallasScreenState();
}

class _dallasScreenState extends State<dallasScreen> {
  final inputCodeController = TextEditingController();
  var dallasState = "";

  void _submitCode() {
    if (inputCodeController.text.isEmpty)
      return;
    else if (inputCodeController.text == "DALLAS") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => startScreen()));
    } else {
      inputCodeController.text == "";
    }
  }

  @override
  void initState() {
    dallasState = "dallasRiddle";
    super.initState();
  }

  @override
  void dispose() {
    dallasState = "";
    super.dispose();
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
          child: dallasState == "dallasRiddle"
              ? Column(
                  children: [
                    Container(
                      height: 200,
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 35,
                      margin: EdgeInsets.all(25),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        controller: inputCodeController,
                        decoration: InputDecoration(
                          fillColor: Colors.amber[200],
                          hintText: '********',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
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
                )
              : Column(),
        ),
      ),
    );
  }
}
