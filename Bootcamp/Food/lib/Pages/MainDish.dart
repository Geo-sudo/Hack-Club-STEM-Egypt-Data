import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Chicken%20Pasta%20Choice.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Chicken%20Teryaki%20Choice.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Classic%20MeatLoaf%20choice.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Creamy%20Tomato%20Pasta%20choice.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Descriptions/Chicken%20Pasta%20Describtion.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Descriptions/Chicken%20Teryaki%20Describtion.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Descriptions/Classic%20Meatloaf%20Decribtion.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Descriptions/Creamy%20Tomato%20Pasta%20Describtion.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class MainDish extends StatefulWidget {
  const MainDish({super.key});

  @override
  State<MainDish> createState() => _MainDishState();
}

class _MainDishState extends State<MainDish> {
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
            padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  const DarshRecipes(),
                  const SizedBox(
                    height: 10,
                  ),
                  // From here Start Editing the program
                  // First Choice
                  InkWell(
                    child: const CreamyPastaChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              const CreamyTomatoPastaDescribtion()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  // Second Choice
                  InkWell(
                    child: ClassicMeatLoafChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ClassicMeatloafDescribtion()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: ChickenTeryakiChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChickenTeryakiDescribtion()));
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: ChickenPastaChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChickenPastaDescribtion()));
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
