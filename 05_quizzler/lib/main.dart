import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
  int rightAnsValue = 0;
  Icon rightAnswer() {
    return const Icon(Icons.check_rounded, color: Colors.green);
  }

  Icon wrongAnswer() {
    return const Icon(Icons.cancel_rounded, color: Colors.red);
  }

  int questionNum = 0;
  List<Widget> scoreKeeper = [];

  void checkAnswer(bool userAnswer) {
    bool correctAns = quizBrain.getQuestionAns();
    setState(() {
      if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          type: AlertType.error,
          title: "END OF THE QUIZ",
          desc: "Your Score was $rightAnsValue",
          buttons: [
            DialogButton(
              onPressed: () => Navigator.pop(context),
              width: 120,
              child: Text(
                "OK",
                style: TextStyle(color: Colors.grey.shade500, fontSize: 20),
              ),
            )
          ],
        ).show();
        quizBrain.reset();
        scoreKeeper.clear();
        rightAnsValue = 0;
      } else {
        if (userAnswer == correctAns) {
          rightAnswer();
          scoreKeeper.add(rightAnswer());
          rightAnsValue++;
        } else {
          wrongAnswer();
          scoreKeeper.add(wrongAnswer());
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
          child: Text(
            'Score: $rightAnsValue',
            style: GoogleFonts.sourceSans3(
              textStyle: const TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF00FF00),
              ),
              onPressed: () {
                checkAnswer(true);
              },
              child: Text(
                'True',
                style: GoogleFonts.sourceSans3(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF0000),
              ),
              onPressed: () {
                checkAnswer(false);
              },
              child: Text(
                'False',
                style: GoogleFonts.sourceSans3(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        ),
        // Added a row here as your score keeper
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
