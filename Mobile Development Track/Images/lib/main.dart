// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import './input.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget{ 
  
  @override
  Widget build(BuildContext ctx)
  { 

    return MaterialApp(home: Scaffold(
      appBar: AppBar(title:Text("Here's title")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: NetworkImage("https://i.imgur.com/Nlpl5R3.jpeg"))
          , Text("Idk him")
          
      ]
      )
    ));
  }
}
