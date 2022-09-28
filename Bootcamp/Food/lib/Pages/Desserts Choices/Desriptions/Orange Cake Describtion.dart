import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';

class OrangeCakeDescribtion extends StatefulWidget {
  const OrangeCakeDescribtion({super.key});

  @override
  State<OrangeCakeDescribtion> createState() => _OrangeCakeDescribtionState();
}

class _OrangeCakeDescribtionState extends State<OrangeCakeDescribtion> {
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
                        "-  3 eggs.",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 table spoon of Vanilla.",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  Cup of sugar.",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  Cup of milk.",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  cup of fresh orange juice.",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 baking powder table spoon.",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 cups of flour.",
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
                        "1. Use a blender to mix 3 eggs, 2 tsp of vanilla, cup of sugar, cup of sugar, 3 pieces of butter, 1 cup of fresh orange juice    ",
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
                          "2. Leave aside a bowl full of 2 cups of flour, baking powder 1 table spoon ",
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
                          "3. add them gradually to the mixture and mix it slowly with the hand blinder for a smooth mixture.",
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
                          "4. Bake in preheated oven at 160 for 20-30 mins.",
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
                          "5. add 1 table spoon of vanilla",
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
                          "6. add 3-4 cups of flour ",
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
                          "7. add 1 table spoon baking powder  ",
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
                          "8. Now use a wooden spoon to stir it quickly or use a hand blender for even distribution.  ",
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
                          "9. after that , add the cocoa sauce and mix gradually until it forms a perfect smooth mixture.  ",
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
                          "10. Bake in a preheated oven at 180-160 for 30-40 min.  ",
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
