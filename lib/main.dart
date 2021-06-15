import 'package:flutter/material.dart';
import 'package:quiz/question_bank.dart';

void main() => runApp(Quiz());

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  QuizBrain quizBrain = QuizBrain();
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true &&
          quizBrain.questionLength > scoreKeeper.length) {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }

        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            // Here you can write your code for open new view
            showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Text('খেলা শেষ'),
                      elevation: 20,
                      content: Text("আবার  শুরু  করতে reset চাপুন।"),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              quizBrain.reset();
                              scoreKeeper = [];
                            });

                            Navigator.pop(context);
                          },
                          child: Text("reset"),
                        )
                      ],
                    ),
                barrierDismissible: false);
          });
        });
      } else if (quizBrain.isFinished() == false &&
          quizBrain.questionLength > scoreKeeper.length) {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          scoreKeeper.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.green,
            child: TextButton(
              child: Text(
                'হ্যাঁ',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(true);
              },
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Expanded(
          child: Container(
            color: Colors.red,
            child: TextButton(
              child: Text(
                'না',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                checkAnswer(false);
              },
            ),
          ),
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}
