import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SmallText extends StatelessWidget {
  final Color? color;
  final String text;
  double? size;
  double height;

  SmallText(
      {super.key,
      this.color = Colors.white,
      this.size = 20,
      this.height = 1.2,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: size,
        height: height,
      ),
    );
  }
}
