import 'package:flutter/material.dart';
import './screens/start_screen.dart';
import './screens/quiz_screen.dart';
import './screens/result_screen.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context)
  {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartSceen(),
      routes:
      {
        QuizScreen.routename: (ctx) => QuizScreen(),
        ResultScreen.routeName: (ctx) => ResultScreen()
      }
    );
  }
}

