import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Widgets/SmallText.dart';

class DarshRecipes extends StatelessWidget {
  const DarshRecipes({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SmallText(
          text: "Darsh",
          color: Colors.red,
        ),
        SmallText(
          text: "Recipes",
          size: 20,
          color: Colors.black,
        )
      ],
    );
  }
}
