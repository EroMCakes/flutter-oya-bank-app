import 'package:flutter/material.dart';
import 'package:oyabank/screens/codeAnniv.dart';

import 'dalasScreen.dart';
import '../Widgets/annivshow.dart';

class birthdayScreen extends StatefulWidget {
  @override
  _birthdayScreenState createState() => _birthdayScreenState();
}

class _birthdayScreenState extends State<birthdayScreen> {
  final inputCodeController = TextEditingController();
  bool _cor = true;

  void _submitCode() {
    setState(() {
      if (inputCodeController.text == '24062010') {
        _cor = true;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => codeAnniv()));
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
            'Ma fille bien aimée',
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
                margin: EdgeInsets.all(25),
                child: TextField(
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  controller: inputCodeController,
                  decoration: InputDecoration(
                    fillColor: Colors.amber[200],
                    hintText: '********',
                    hintStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    errorText: !_cor ? 'Mauvaise réponse!' : null,
                    errorStyle: TextStyle(
                      decoration: TextDecoration.underline,
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
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Icon(
            Icons.search,
            color: Colors.black,
          ),
          onPressed: () => {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => annivShow()))
          },
        ),
      ),
    );
  }
}
