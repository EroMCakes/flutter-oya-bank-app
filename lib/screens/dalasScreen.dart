import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import './diamondScreen.dart';
import './state.dart';

class dallasScreen extends StatefulWidget {
  @override
  _dallasScreenState createState() => _dallasScreenState();
}

class _dallasScreenState extends State<dallasScreen> {
  final inputCodeController = TextEditingController();
  // var dallasState = "";
  late VideoPlayerController _videoPlayerController;
  late Future<void> _initializeVideoPlayerFuture;

  void _submitCode() {
    if (inputCodeController.text.isEmpty)
      return;
    else if (inputCodeController.text == "DALLAS" ||
        inputCodeController.text == "Dallas" ||
        inputCodeController.text == 'dallas') {
      setState(() {
        dallasState = "dallasSolution";
      });
    } else {
      inputCodeController.clear();
    }
  }

  @override
  void initState() {
    if (dallasState == "") {
      dallasState = "dallasRiddle";
    }

    _videoPlayerController =
        VideoPlayerController.asset('assets/videos/videoCoffre.mp4');
    _initializeVideoPlayerFuture = _videoPlayerController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
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
                        textAlign: TextAlign.center,
                        controller: inputCodeController,
                        decoration: InputDecoration(
                          fillColor: Colors.amber[200],
                          hintText: '******',
                          hintStyle: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onSubmitted: (_) {
                          _submitCode();
                        },
                      ),
                    ),
                    OutlinedButton(
                      child: Icon(Icons.check),
                      onPressed: () {
                        _submitCode();
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          width: 2,
                          color: Colors.amber,
                        ),
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FutureBuilder(
                      future: _initializeVideoPlayerFuture,
                      builder: (context, snapshot) {
                        return Container(
                          padding: EdgeInsets.only(top: 0, bottom: 15),
                          height: MediaQuery.of(context).size.height * 0.80,
                          child: AspectRatio(
                            aspectRatio:
                                _videoPlayerController.value.aspectRatio,
                            child: GestureDetector(
                              child: VideoPlayer(_videoPlayerController),
                              onTap: () {
                                setState(() {
                                  if (_videoPlayerController.value.isPlaying) {
                                    _videoPlayerController.pause();
                                  } else {
                                    _videoPlayerController.play();
                                  }
                                });
                              },
                            ),
                          ),
                        );
                      },
                    ),
                    OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => DiamondScreen()));
                      },
                      child: Icon(Icons.skip_next_outlined),
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(
                        width: 2,
                        color: Colors.amber,
                      )),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}
