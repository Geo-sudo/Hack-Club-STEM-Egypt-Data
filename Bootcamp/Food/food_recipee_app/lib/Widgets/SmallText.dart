import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_recipee_app/Utils/Colors.dart';

class SmallText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow Overflow;

  SmallText(
      {Key? key,
      this.color = Colors.white,
      this.Overflow = TextOverflow.ellipsis,
      this.size = 15,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: Overflow,
      style:
          TextStyle(color: color, fontWeight: FontWeight.w400, fontSize: size),
    );
  }
}
