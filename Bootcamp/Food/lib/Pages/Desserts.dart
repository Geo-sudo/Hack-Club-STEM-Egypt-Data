import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Cheese%20Cake%20Choice.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Chocolate%20Cake%20Choice.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Cinnabon%20Choice.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Desriptions/Cheese%20Cake%20Describtion.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Desriptions/Chocolate%20Cake%20Describtion.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Desriptions/Cinnabon%20Describtion.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Desriptions/Orange%20Cake%20Describtion.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Desriptions/Tiramisu%20Describtion.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Orange%20Cake%20Choice.dart';
import 'package:food_recipee_app/Pages/Desserts%20Choices/Tiramisu%20Choice.dart';
import 'package:food_recipee_app/Pages/Drinks.dart';
import 'package:food_recipee_app/Pages/Main%20Dish%20Choices/Creamy%20Tomato%20Pasta%20choice.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class Desserts extends StatefulWidget {
  const Desserts({super.key});

  @override
  State<Desserts> createState() => _DessertsState();
}

class _DessertsState extends State<Desserts> {
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
              left: 15,
              right: 15,
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
                    child: CinnabonChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CinnabonDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: CheeseCakeChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CheeseCakeDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: TiramisuChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => TiramisuDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: ChocolateCakeChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChocolateCakeDescribtion()));
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: OrangeCakeChoice(),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrangeCakeDescribtion()));
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
