import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ClassicMeatLoafChoice extends StatefulWidget {
  const ClassicMeatLoafChoice({super.key});

  @override
  State<ClassicMeatLoafChoice> createState() => _ClassicMeatLoafChoiceState();
}

class _ClassicMeatLoafChoiceState extends State<ClassicMeatLoafChoice> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color.fromARGB(255, 232, 229, 229)),
      child: (Row(
        children: [
          Padding(
              padding: EdgeInsets.only(
            left: 15,
          )),
          Container(
            width: 125,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/image/Classic Meatloaf.png")),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Classic Meatloaf",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                      color: Colors.red),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.timer,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "1 Hour 15 Mins",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Text("Prep Time: 15 Mins"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Cook Time: 1 Hour")
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
