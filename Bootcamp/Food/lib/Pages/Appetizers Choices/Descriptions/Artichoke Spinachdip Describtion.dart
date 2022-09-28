import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';

class ArtichokeSpinachDipDescribtion extends StatefulWidget {
  const ArtichokeSpinachDipDescribtion({super.key});

  @override
  State<ArtichokeSpinachDipDescribtion> createState() =>
      _ArtichokeSpinachDipDescribtionState();
}

class _ArtichokeSpinachDipDescribtionState
    extends State<ArtichokeSpinachDipDescribtion> {
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
                        "-  2 tablespoons olive oil",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 large garlic clove, finely chopped",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 12-ounce bunch fresh spinach, finely chopped ",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  Pinch of red-pepper flakes (optional)",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  Kosher salt and black pepper",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 (14-ounce) can quartered artichoke hearts, drained and coarsely chopped",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  8 ounces cream cheese, cut into 1-inch pieces",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  4 ounces fresh mozzarella, torn or shredded",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  4 ounces sour cream or full-fat Greek yogurt",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ¼ cup Pecorino Romano or Parmesan, finely grated",
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
                        "1. Heat olive oil in a medium pot over medium heat. Add garlic and cook, stirring until it’s softened and fragrant, about 30 seconds.",
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
                          "2. Add spinach to pot one handful at a time, letting each handful completely wilt before adding the next. Add crushed red pepper, if using, and season with salt and pepper. Continue to cook, stirring frequently, until most of the liquid from the spinach has evaporated (no need to drain), about 3 minutes. Add artichokes and season with salt and pepper. Cook for a few minutes, just to take the raw edge off the artichokes.",
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
                          "3. Reduce heat to low and add cream cheese and mozzarella. Using a wooden spoon or spatula, stir until all the cheese has melted, about 3 minutes. Stir in sour cream and pecorino, and season with more salt and pepper. You can certainly eat this dip straight from the pot (or transferred to a serving bowl), but running it under the broiler for a crispy top is also an excellent option. To do so, transfer dip to a small ovenproof skillet (6 to 8 inches). Place in oven and broil until the top is golden and the dip is bubbling, 5 to 8 minutes. Let sit a minute or two before serving.",
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
