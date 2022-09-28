import 'dart:html';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utils/Colors.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Container el background
          Container(
            decoration: BoxDecoration(color: AppColors.maincolor),
          ),
          // ay 7aga 3la el background tbda2 mn hena
          // da container el Top row
          Container(
            padding: EdgeInsets.only(top: 70, left: 30, right: 30),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SmallText(text: "Chef Darsh "),
                    Text(
                      "Recipes",
                      style: TextStyle(color: AppColors.BlueText, fontSize: 25),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                SmallText(text: "Got a meal but can't do it?")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
