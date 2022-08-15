import 'package:flutter/material.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../models/questions.dart';

class ResultScreen extends StatelessWidget {
  static const String routeName = '/result-screen';

  int calculateScore(String answers) {
    int perc = 0;

    for (int i = 0; i < answers.length; i++) {
      perc += Questions[i]['Points'][int.parse(answers[i])];
    }

    print(perc);
    print((perc / 10).toInt());

    return (perc / 10).toInt() * 10;
  }

  @override
  Widget build(BuildContext context) {
    final String answers = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            FlatButton(
              child: Text(
                "Quit",
                style: TextStyle(
                    color: Theme.of(context).errorColor, fontSize: 18),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacementNamed("/");
              },
            )
          ],
        ),
        body: Stack(children: [
          WebsafeSvg.asset("assets/images/bg.svg",
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover),
          SafeArea(
            child: Center(
              child: Container(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Column(
                    children: [
                      Spacer(
                        flex: 2,
                      ),
                      Text(
                          "You might be diagnosed with Lung Cancer by a percentage of:",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Color(0xFFC1C1C1))),
                      Spacer(flex: 1),
                      Text(
                          "${calculateScore(answers)}-${calculateScore(answers) + 10}%",
                          style: Theme.of(context)
                              .textTheme
                              .headline5
                              .copyWith(color: Color(0xFFC1C1C1))),
                      Spacer(
                        flex: 2,
                      )
                    ],
                  )),
            ),
          )
        ]));
  }
}
