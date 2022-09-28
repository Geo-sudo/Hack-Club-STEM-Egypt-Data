import 'package:flutter/material.dart';

class CreamyPastaChoice extends StatefulWidget {
  const CreamyPastaChoice({super.key});

  @override
  State<CreamyPastaChoice> createState() => _CreamyPastaChoiceState();
}

class _CreamyPastaChoiceState extends State<CreamyPastaChoice> {
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
                  image: AssetImage("assets/image/Creamy Tomato Pasta.png")),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Creamy Tomato Pasta",
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
                      width: 10,
                    ),
                    Text(
                      "25 Mins",
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Column(
                  children: [
                    Text("Prep Time: 5 Mins"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Cook Time: 20 Mins")
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
