import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';

class CheeseCakeDescribtion extends StatefulWidget {
  const CheeseCakeDescribtion({super.key});

  @override
  State<CheeseCakeDescribtion> createState() => _CheeseCakeDescribtionState();
}

class _CheeseCakeDescribtionState extends State<CheeseCakeDescribtion> {
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
                      Text(
                        "Crust:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
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
                        "-  1 ¼ cups graham cracker crumbs",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ⅓ cup butter, melted",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ¼ cup white sugar",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 teaspoons ground cinnamon",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: const [
                      Text(
                        "Filling:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  2 (10 ounce) packages frozen sweetened sliced strawberries, thawed and drained",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 tablespoon cornstarch",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  3 (8 ounce) packages cream cheese, softened",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  1 (14 ounce) can sweetened condensed milk",
                        style: TextStyle(fontSize: 17),
                      ))
                    ],
                  ),
                  Row(
                    children: const [
                      Flexible(
                          child: Text(
                        "-  ¼ cup lemon juice",
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
                        "-  3 eggs",
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
                        "1. Make crust: Combine graham cracker crumbs, butter, sugar, and cinnamon in a bowl; mix well. Press onto the bottom of an ungreased 9-inch springform pan. Place in the refrigerator to chill for 30 minutes.",
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
                          "2. Preheat the oven to 300 degrees F (150 degrees C).",
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
                          "3. Make filling: Place strawberries and cornstarch into a blender. Cover and puree until smooth.",
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
                          "4. Pour strawberry sauce into a saucepan and bring to a boil over high heat. Boil and stir until sauce is thick and shiny, about 2 minutes. Set aside ⅓ cup strawberry sauce; cool. Cover and refrigerate remaining sauce for serving.",
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
                          "5. Beat cream cheese in a mixing bowl with an electric mixer until light and fluffy; gradually beat in condensed milk. Mix in lemon juice and vanilla extract, then beat in eggs on low speed until just combined.",
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
                          "6. Pour ½ of the cream cheese mixture over crust; drop ½ of the reserved strawberry sauce by ½ teaspoonfuls on cream cheese layer. Carefully spoon remaining cream cheese mixture over sauce; drop remaining strawberry sauce by ½ teaspoonfuls on top. Cut through the top layer only with a knife to swirl strawberry sauce.",
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
                          "7. Bake in the preheated oven until the center is almost set, 45 to 50 minutes.",
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
                          "8. Cool on a wire rack for 10 minutes. Carefully run a knife around the edge of the pan to loosen; cool for 1 hour at room temperature. Refrigerate 8 hours to overnight before serving.",
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
                          "9. Serve reserved strawberry sauce with cheesecake. If sauce is too thick, stir in water.",
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
