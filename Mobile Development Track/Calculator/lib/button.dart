import 'package:flutter/material.dart';

class MyButton extends StatelessWidget{
  String content;
  final Function selectHandler;
  double w = 80;
  double h = 80;

  MyButton(this.content, this.selectHandler);
  MyButton.wh(this.content, this.selectHandler, this.w, this.h);


  void onPress()
  {
    print(content);
    selectHandler();
  }

  Widget build(BuildContext ctx)
  {
    return Container(
      width: w,
      height: h,
      
      child: ElevatedButton(
        child: Text(content), 
        onPressed: onPress, 
        ),
    );
    }
}