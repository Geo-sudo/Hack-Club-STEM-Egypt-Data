import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';

class CinnabonDescribtion extends StatefulWidget {
  const CinnabonDescribtion({super.key});

  @override
  State<CinnabonDescribtion> createState() => _CinnabonDescribtionState();
}

class _CinnabonDescribtionState extends State<CinnabonDescribtion> {
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
                    height: 15,
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        " Dough: ",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 cup warm milk 45 degrees C",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 eggs, room temperature",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ⅓ cup margarine, melted",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  4 ½ cups bread flour",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 teaspoon salt",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ½ cup white sugar",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 ½ teaspoons bread machine yeast",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "Filling:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 cup brown sugar, packed",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 ½ tablespoons ground cinnamon",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ⅓ cup butter, softened",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "Icing:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 ½ cups confectioners' sugar",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ¼ cup butter, softened",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 (3 ounce) package cream cheese, softened",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ½ teaspoon vanilla extract",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ⅛ teaspoon salt",
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
                        "1. Prepare dough: Place milk, eggs, margarine, flour, salt, white sugar, and yeast in the pan of a bread machine in the order recommended by the manufacturer. Select dough cycle; press Start.",
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
                          "2. When dough has doubled in size, turn it out onto a lightly floured surface. Cover it with a kitchen towel or plastic wrap and let it rest for 10 minutes.",
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
                          "3. Roll dough on a lightly floured surface to a 16x21-inch rectangle.",
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
                          "4. Prepare filling: Combine brown sugar and cinnamon in a small bowl. Spread softened butter over the dough, then sprinkle cinnamon-sugar mixture evenly over top.",
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
                          "5. Starting at the longer end, roll up the dough; cut into 12 rolls. Place rolls in a lightly greased 9x13-inch baking pan. Cover and let rise until nearly doubled, about 30 minutes.",
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
                          "6. Meanwhile, preheat the oven to 200 degrees C.",
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
                          "7. Bake rolls in the preheated oven until golden brown, about 15 minutes.",
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
                          "8. While rolls are baking, prepare icing: Beat confectioners' sugar, butter, cream cheese, confectioners' sugar, vanilla, and salt until creamy.",
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
                          "9. Spread icing on warm rolls before serving.",
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
