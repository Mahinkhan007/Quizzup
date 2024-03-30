import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'questions.dart';
import 'questionbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            child: QuizAppPage(),
          ),
        ),
      ),
    );
  }
}

class QuizAppPage extends StatefulWidget {
  const QuizAppPage({super.key});

  @override
  State<QuizAppPage> createState() => _QuizAppPageState();
}

class _QuizAppPageState extends State<QuizAppPage> {
  List<Icon> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAnswer = quizBrain.getQuesAns();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
                context: context,
                title: "Finished!",
                desc: "The quiz have ended.")
            .show();

        quizBrain.reset();
        scoreKeeper = [];
      } else {
        if (userAnswer == correctAnswer) {
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
      }

      quizBrain.nextQues();
    });
  }
  // List<String> questions = [
  //   'South Africa has one capital',
  //   'The Atlantic ocean is the biggest ocean in the world',
  //   'Greenland is the largest Island in the world',
  //   'Toy Story was pixar\'s first movie'
  // ];
  //
  // List<bool> answers = [false, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Padding(
              padding: EdgeInsets.all(0.0),
              child: Center(
                child: Text(
                  quizBrain.getQuesText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(fontSize: 20.0),
                    minimumSize: Size(250, 20),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white),
                onPressed: () {
                  checkAnswer(true);
                },
                child: Text(
                  'True',
                )),
          )),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45.0, vertical: 15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white),
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text('False'),
              ),
            ),
          ),
          Row(children: scoreKeeper)
        ]);
  }
}
