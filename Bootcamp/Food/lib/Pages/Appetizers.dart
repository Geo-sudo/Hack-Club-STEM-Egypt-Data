import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Pages/Appetizers%20Choices/Artichoke%20Spinachdip%20choice.dart';
import 'package:food_recipee_app/Pages/Appetizers%20Choices/Descriptions/Artichoke%20Spinachdip%20Describtion.dart';
import 'package:food_recipee_app/Pages/Appetizers%20Choices/Descriptions/Grape%20Leaves%20Describtion.dart';
import 'package:food_recipee_app/Pages/Appetizers%20Choices/Grape%20Leaves%20Choice.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Creamy%20Tomato%20Pasta%20choice.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class Appetizers extends StatefulWidget {
  const Appetizers({super.key});

  @override
  State<Appetizers> createState() => _AppetizersState();
}

class _AppetizersState extends State<Appetizers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.height,
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 20, right: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DarshRecipes(),
                  SizedBox(
                    height: 10,
                  ),
                  // Start editing the app from here for the list
                  // First Choice
                  InkWell(
                    child: ArtichokeSpinachdipChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ArtichokeSpinachDipDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Second Choice
                  InkWell(
                    child: GrapeLeavesChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => GrapeLeavesDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
