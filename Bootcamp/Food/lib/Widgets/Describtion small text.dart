import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class DescribtionSmallText extends StatelessWidget {
  final String text;
  double size;

  DescribtionSmallText({super.key, this.size = 17, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: size,
      ),
    );
  }
}
