import 'package:flutter/material.dart';
import 'package:food_recipee_app/Views/home_view.dart';
import 'dart:html';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Egyptian Darsh Recipees',
      home: const HomeView(),
    );
  }
}
