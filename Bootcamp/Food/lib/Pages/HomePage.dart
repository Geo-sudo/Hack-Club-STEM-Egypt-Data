import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Pages/Appetizers.dart';
import 'package:food_recipee_app/Pages/Desserts.dart';
import 'package:food_recipee_app/Pages/Drinks.dart';
import 'package:food_recipee_app/Pages/MainDish.dart';
import 'package:food_recipee_app/Utilities/DarshRecipes.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
          ),
          Container(
            padding: EdgeInsets.only(top: 50, left: 30, right: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DarshRecipes(),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Want to have a great meal ?",
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Select the food type type that you want.",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 25.0, color: Colors.grey)
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/image/Main Dish 2.png"),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 150,
                            height: 145,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => MainDish()));
                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 25.0, color: Colors.grey)
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/image/Appetizers.png"),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 150,
                            height: 145,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Appetizers()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 35),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Main Dish",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(left: 100),
                          child: Text(
                            "Appetizers",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    // Bottom 2 Pics
                    Row(
                      children: [
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 25.0, color: Colors.grey)
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/Desserts.png"),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 150,
                            height: 145,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Desserts()));
                          },
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        InkWell(
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(blurRadius: 25.0, color: Colors.grey)
                              ],
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/image/Drinks.png"),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: 150,
                            height: 145,
                          ),
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Drinks()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // El row elly feeh text el 2 pics elly ta7t
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 35),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Desserts",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                        ),
                        // El text bta3 sooret El drinks
                        Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.only(left: 150),
                          child: Text(
                            "Drinks",
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 17,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
