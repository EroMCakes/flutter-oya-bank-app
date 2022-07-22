import 'package:flutter/material.dart';
import './state.dart';

class DiamondScreen extends StatefulWidget {
  const DiamondScreen({Key? key}) : super(key: key);

  @override
  State<DiamondScreen> createState() => _DiamondScreenState();
}

class _DiamondScreenState extends State<DiamondScreen> {
  // var diamondState = "diamondRiddle";
  final inputCodeController = TextEditingController();
  void _cor = true;

  @override
  void initState() {
    if (diamondState == "") {
      setState(() {
        diamondState = "diamondRiddle";
      });
    }
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _submitCode() {
    setState(() {
      if (inputCodeController.text == 'DIAMOND' ||
          inputCodeController.text == 'Diamond' ||
          inputCodeController.text == "diamond") {
        _cor = true;
        setState(() {
          diamondState = "diamondSolution";
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
          title: Text(
            'Lumière Noire',
            style: TextStyle(
              color: Colors.amber,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: diamondState != "diamondSolution"
              ? SingleChildScrollView(
                  child: Column(children: [
                    Container(
                      alignment: Alignment.center,
                      width: 200,
                      height: 35,
                      margin: EdgeInsets.all(25),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: inputCodeController,
                        decoration: InputDecoration(
                          fillColor: Colors.amber[200],
                          hintText: '*******',
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
                  ]),
                )
              : Column(
                  children: [
                    SizedBox(
                      height: 400,
                    ),
                    Container(
                      child: Text(
                        'Le code est :  5420',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
