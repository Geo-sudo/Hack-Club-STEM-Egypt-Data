import 'package:flutter/material.dart';
import 'dart:async';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int minutes = 30;
  int seconds = 0;
  String msg = 'Start Session';
  Timer? timer;
  bool running = false;
  final player = AudioPlayer();
  void SetPlayer() async {
    await player.setSource(AssetSource('clock-alarm-8761.wav'));
    await player.resume();
  }

  void startTimer(){
    if(running){
      msg = 'Cancel Session';
      timer = Timer.periodic(Duration(seconds : 1), (timer) {
        setState(() {
          if((seconds == 0 && minutes == 0) || !running){
            if(seconds == 0 && minutes == 0){
              SetPlayer();
            }
            stopTimer();

          }else if(seconds == 0 && minutes != 0){
            seconds = 59;
            minutes--;
          }else{
            seconds--;
          }

        });
      });
    }

  }
  void stopTimer(){
    timer?.cancel();
    minutes = 30;
    seconds = 0;
    msg = 'Start Session';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        centerTitle: true,
        elevation: 0,
        title: Text(
          'Posture Checker',
          style: TextStyle(
            fontFamily: 'Shadow',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.yellowAccent,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$minutes : $seconds',
              style: TextStyle(
                fontFamily: 'Shadow',
                fontSize: 70,
                fontWeight: FontWeight.bold,
                color: Colors.yellowAccent
              ),

            ),
            SizedBox(height: 70,),
            ElevatedButton(
                onPressed: () {
                  running = !running;
                  startTimer();
                },
                child: Text(
                    '$msg',
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Shadow',
                    fontSize: 20,
                    color: Colors.grey[900],
                  ),
                ),
              style: ElevatedButton.styleFrom(
                primary: Colors.yellowAccent,
                padding: EdgeInsets.fromLTRB(30, 10, 30, 10)
              ),
            )
          ],
        ),
      ),
    );
  }
}


