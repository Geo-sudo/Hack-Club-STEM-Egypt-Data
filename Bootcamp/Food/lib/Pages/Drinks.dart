import 'package:food_recipee_app/Pages/Drinks%20Choices/Chocolate%20Frappucino%20Choice.dart';
import 'package:food_recipee_app/Pages/Drinks%20Choices/Descriptions/Chocolate%20Frappucino%20Describtion.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Pages/Drinks%20Choices/Chocolate%20Milkshak%20Choice.dart';
import 'package:food_recipee_app/Pages/Drinks%20Choices/Descriptions/Chocolat%20Milkshake%20Describtion.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Creamy%20Tomato%20Pasta%20choice.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class Drinks extends StatefulWidget {
  const Drinks({super.key});

  @override
  State<Drinks> createState() => _DrinksState();
}

class _DrinksState extends State<Drinks> {
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
            padding: EdgeInsets.only(
              top: 50,
              left: 20,
              right: 20,
            ),
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
                    child: ChocolateMilkshakeChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ChocolateMilkshakeDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: ChocolateFrappucinoChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ChocolateFrappucinoDescribtion()));
                    },
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
