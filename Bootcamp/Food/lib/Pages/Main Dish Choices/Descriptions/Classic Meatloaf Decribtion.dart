import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';

class ClassicMeatloafDescribtion extends StatefulWidget {
  const ClassicMeatloafDescribtion({super.key});

  @override
  State<ClassicMeatloafDescribtion> createState() =>
      _ClassicMeatloafDescribtionState();
}

class _ClassicMeatloafDescribtionState
    extends State<ClassicMeatloafDescribtion> {
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
                        "-  1 ½ pounds ground meatloaf mix (equal parts ground beef, pork and veal or turkey)",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 cup dried breadcrumbs",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 tablespoons chopped fresh flat-leaf parsley",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 large eggs, lightly beaten",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 medium onion, grated",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 clove garlic, minced",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ½ cup ketchup",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 tablespoon plus 1 teaspoon Worcestershire sauce",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  Kosher salt and freshly ground black pepper",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 teaspoons light brown sugar",
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
                        "1. Preheat the oven to 350 degrees F. Line a rimmed baking sheet with parchment.",
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
                          "2. Combine the meatloaf mix, breadcrumbs, parsley, eggs, onion, garlic, ¼ cup of the ketchup, 1 tablespoon of the Worcestershire, 1 ½ teaspoons salt and ½ teaspoon pepper in a large mixing bowl. Using your hands, mix together until well combined.",
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
                          "3. Transfer the mixture to the prepared baking sheet and form it into a compact oval-shaped loaf about 9 inches by 5 inches. Bake the meatloaf for 30 minutes.",
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
                          "4. Stir the brown sugar together with the remaining ¼ cup ketchup and 1 teaspoon Worcestershire in a small bowl for the glaze. Brush the top and sides of the meatloaf all over with the glaze. Return to the oven and bake until the glaze starts to caramelize and a thermometer inserted in the center of the meatloaf registers 160 degrees F, about 25 minutes more. Let rest for 10 minutes before slicing and serving.",
                          style: TextStyle(fontSize: 17),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
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
