import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';

class ChickenTeryakiDescribtion extends StatefulWidget {
  const ChickenTeryakiDescribtion({super.key});

  @override
  State<ChickenTeryakiDescribtion> createState() =>
      _ChickenTeryakiDescribtionState();
}

class _ChickenTeryakiDescribtionState extends State<ChickenTeryakiDescribtion> {
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
            padding: EdgeInsets.only(top: 50, left: 30, right: 30, bottom: 30),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  DarshRecipes(),
                  const SizedBox(
                    height: 30,
                  ),
                  // The Details
                  Row(
                    children: const [
                      Text(
                        "Ingradients:",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: Colors.red),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  300 grams of boneless chicken breasts",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ¼ cup of soya sauce",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 tablespoon of minced garlic",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 teaspoons of grated ginger",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 tablespoons of sugar ",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ½ teaspoon of honey",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  3 tablespoons of vegetable oil",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 tablespoon of salt",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "Instructions:",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "1. Cut the boneless chicken breast into equal cubes (each one approximately 5-4 cm long and 3 cm wide)",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "2. Mix the soya sauce, 1 teaspoon of garlic, ginger, sugar, honey and 2 tablespoons of oil together",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "3. Add the mixture to the chicken and leave it to marinate for minimum 1 hour (you can leave it in the fridge overnight)",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "4. After the chicken is marinated, add a tablespoon of vegetable oil/butter and 1 teaspoon of garlic to a pan, then add the chicken ",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "5. Let the chicken cook for 15 minutes, then add 1 tablespoon of salt to the chicken and stir it, then leave it for another 5 minutes to cook",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Flexible(
                        child: Text(
                          "Have a great meal",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              fontStyle: FontStyle.italic,
                              color: Colors.red),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
