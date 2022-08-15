import 'package:flutter/material.dart';
import '../widgets/gradient_button.dart';
import 'package:websafe_svg/websafe_svg.dart';
import './quiz_screen.dart';

class StartSceen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      WebsafeSvg.asset("assets/images/bg.svg",
          width: double.infinity, height: double.infinity, fit: BoxFit.cover),
      Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.white,
              radius: MediaQuery.of(context).size.width * 0.25,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/heka.png",
                  scale: 3 / 2,
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.5,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              child: Text("Lung Cancer Detection",
                  style: TextStyle(
                      fontSize: 48,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.start),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            GradientButton(
                text: "Start",
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.9,
                onTap: () {
                  Navigator.of(context).pushReplacementNamed(QuizScreen.routename);
                },
                fontSize: 16)
          ],
        ),
      )
    ]));
  }
}
