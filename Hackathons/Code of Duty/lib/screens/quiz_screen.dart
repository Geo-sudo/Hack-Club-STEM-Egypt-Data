import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../widgets/gradient_button.dart';
import 'package:websafe_svg/websafe_svg.dart';
import '../models/questions.dart';
import './result_screen.dart';

class QuizScreen extends StatefulWidget {
  static const routename = '/questions-screen';

  State<QuizScreen> createState() => QuizSceenState();
}

class QuizSceenState extends State<QuizScreen> {
  int _QuesNum = 0;
  final _QuestionsLength = Questions.length;
  String _answers;
  var _isInit = false;

  @override
  void didChangeDependencies() {
    if (!_isInit) {
      _answers = '-' * _QuestionsLength;
      _isInit = true;
      print(_answers);
    }
    super.didChangeDependencies();
  }

  void nextQuestion() {
    if (_QuestionsLength - 1 >= _QuesNum + 1) {
      setState(() {
        _QuesNum++;
      });
    }
  }

  void prevQuestion() {
    if (0 <= _QuesNum - 1) {
      setState(() {
        _QuesNum--;
      });
    }
  }

  void checkAnswer(int QuestionNO, int position) {
    String newAnswers = "";
    setState(() {
      for (int i = 0; i < _QuestionsLength; i++) {
        if (i == QuestionNO) {
          newAnswers += position.toString();
        } else
          newAnswers += _answers[i];
      }

      _answers = newAnswers;
      print(_answers);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          FlatButton(
            child: Text(
              "Quit",
              style:
                  TextStyle(color: Theme.of(context).errorColor, fontSize: 18),
            ),
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          )
        ],
      ),
      body: Stack(children: [
        WebsafeSvg.asset("assets/images/bg.svg",
            width: double.infinity, height: double.infinity, fit: BoxFit.cover),
        SafeArea(
          child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.05),
              child: Column(
                children: [
                  Container(
                      child: Row(children: [
                    _QuesNum == 0
                        ? Container()
                        : IconButton(
                            icon: Icon(
                              Icons.keyboard_double_arrow_left,
                              size: 32,
                              color: Color(0xFFC1C1C1),
                            ),
                            onPressed: () {
                              prevQuestion();
                            },
                          ),
                    Spacer(),
                    _QuesNum == _QuestionsLength - 1
                        ? GradientButton(
                            text: "Finish",
                            fontSize: 14,
                            height: 32,
                            width: MediaQuery.of(context).size.width * 0.2,
                            onTap: () {
                              if(!_answers.contains("-"))
                              {
                                Navigator.of(context).pushReplacementNamed(ResultScreen.routeName, arguments: _answers);
                              }
                            },
                          )
                        : IconButton(
                            icon: Icon(
                              Icons.keyboard_double_arrow_right,
                              size: 32,
                              color: Color(0xFFC1C1C1),
                            ),
                            onPressed: () {
                              nextQuestion();
                            },
                          )
                  ])),
                  Container(
                    child: Row(children: [
                      Text.rich(TextSpan(
                          text: "Question ${_QuesNum + 1}",
                          style:
                              TextStyle(color: Color(0xFFC1C1C1), fontSize: 32),
                          children: [
                            TextSpan(
                                text: "/$_QuestionsLength",
                                style: TextStyle(
                                    color: Color(0xFFC1C1C1), fontSize: 22))
                          ])),
                    ]),
                  ),
                  Divider(thickness: 1.5),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Material(
                      elevation: 5.0,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          height: MediaQuery.of(context).size.height * 0.7,
                          color: Colors.white,
                          child: LayoutBuilder(
                              builder: (context, constraints) => Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: constraints.maxWidth * 0.05,
                                      vertical: constraints.maxHeight * 0.03),
                                  child: Column(
                                      children: <Widget>[
                                            Container(
                                              height:
                                                  constraints.maxHeight * 0.15,
                                              child: //FittedBox(
                                                  //child:
                                                  Text(
                                                      Questions[_QuesNum]
                                                          ['Question'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6
                                                          .copyWith(
                                                              color:
                                                                  Colors.black),
                                                      textAlign:
                                                          TextAlign.start),
                                            ),
                                            //),
                                            SizedBox(
                                                height: constraints.maxHeight *
                                                    0.02),
                                          ] +
                                          Questions[_QuesNum]['Answers']
                                              .map<Widget>((answer) {
                                            int position = Questions[_QuesNum]
                                                    ['Answers']
                                                .indexOf(answer);

                                            return _answers[_QuesNum] ==
                                                    position.toString()
                                                ? AnswerButton(
                                                    answer,
                                                    _QuesNum,
                                                    position,
                                                    constraints.maxHeight,
                                                    checkAnswer,
                                                    isChecked: true,
                                                  )
                                                : AnswerButton(
                                                    answer,
                                                    _QuesNum,
                                                    position,
                                                    constraints.maxHeight,
                                                    checkAnswer);
                                          }).toList())))),
                    ),
                  ),
                ],
              )),
        )
      ]),
    );
  }
}

class AnswerButton extends StatelessWidget {
  final String answer;
  final int questionNO;
  final int position;
  final maxHeight;
  final isChecked;
  final Function Check;

  AnswerButton(
      this.answer, this.questionNO, this.position, this.maxHeight, this.Check,
      {this.isChecked = false});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: GestureDetector(
        onTap: () {
          Check(questionNO, position);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: maxHeight * 0.015),
          width: double.infinity,
          height: maxHeight * 0.12,
          decoration: BoxDecoration(
              color: isChecked? Colors.greenAccent.shade400 : Colors.white, 
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: Colors.grey)),
          child: LayoutBuilder(
              builder: ((context, constraints) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: constraints.maxWidth * 0.07),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text("${position + 1}. $answer",
                              style: TextStyle(
                                color: isChecked? Colors.white : Colors.grey,
                              )),
                        ),
                        Icon(
                          isChecked? Icons.check_circle : Icons.circle_outlined,
                          color: isChecked?Colors.white : Colors.grey,
                        )
                      ])))),
        ),
      ),
    );
  }
}
