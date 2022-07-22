import 'package:flutter/material.dart';
import 'package:oyabank/screens/dalasScreen.dart';

import '../Widgets/annivshow.dart';
import 'state.dart';

class birthdayScreen extends StatefulWidget {
  @override
  _birthdayScreenState createState() => _birthdayScreenState();
}

class _birthdayScreenState extends State<birthdayScreen> {
  final inputCodeController = TextEditingController();
  bool _cor = true;
  // var birthdayState = "";

  @override
  void initState() {
    birthdayState = "birthdayRiddle";

    super.initState();
  }

  void _submitCode() {
    setState(() {
      if (inputCodeController.text == '24062010') {
        _cor = true;
        setState(() {
          birthdayState = "birthdaySolution";
        });
      } else {
        _cor = false;
        inputCodeController.clear();
      }
    });
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
          automaticallyImplyLeading: false,
          title: Text(
            birthdayState == "birthdaySolution"
                ? 'TIROIR DU BAS'
                : "Ma fille bien-aimée",
            style: TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: birthdayState != "birthdaySolution"
              ? SingleChildScrollView(
                  child: Column(
                    children: [
                      // Container(
                      //   height: 350,
                      // ),
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
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 400,
                    ),
                    Container(
                      child: Text(
                        'Le code est :  ↑ ↑ ← ← ↑ ↑ →',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            birthdayState != "birthdaySolution"
                ? Icons.search
                : Icons.skip_next_outlined,
            color: Colors.black,
          ),
          onPressed: () => {
            birthdayState != "birthdaySolution"
                ? Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => annivShow()))
                : Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => dallasScreen()))
          },
        ),
      ),
    );
  }
}
