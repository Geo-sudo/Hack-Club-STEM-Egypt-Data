import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget{

  final Function onTap;
  final String text;
  final double width;
  final double height;
  final double fontSize;

  GradientButton({this.text, this.height, this.width, this.onTap, this.fontSize});

  Widget build(BuildContext context)
  {
    return Container(
              width: width, 
              height: height, 
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                      colors: [Color(0xFF46A0AE), Color(0xFF00FFCB)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    onTap();
                  },
                  child: Container(
                      alignment: Alignment.center,
                      child: Text(text,
                          style: TextStyle(color: Colors.black, fontSize: fontSize))),
                ),
              ),
            );
  }

}