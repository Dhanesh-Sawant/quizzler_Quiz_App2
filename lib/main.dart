import 'package:flutter/material.dart';
import 'question.dart';
import 'QuizBrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain newQuizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizPage();
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> showIcons = [];
  // List<String> showQ = [
  //   'You can lead the cow downstairs but not upstairs.',
  //   'Approximately one quarter of human bones are in feet.',
  //   'A slug\'s blood is green.',
  // ];
  //
  // List<bool> ans = [true, false, false];
  //

  //
  // Question q1 = Question('You can lead the cow downstairs but not upstairs.',true);
  // Question q2 = Question('Approximately one quarter of human bones are in feet.',false);
  // Question q3 = ('A slug\'s blood is green.,false');

  void checkAnswers(bool usersAns)
  {
    setState(() {

      if(newQuizBrain.isFinished()==true)
        {
          Alert(context: context, title: "Finished!!", desc: "You have reached the end of the quiz!!").show();
          newQuizBrain.reset();
          showIcons=[];
        }
      else {
        if (newQuizBrain.getAnswer() == usersAns) {
          showIcons.add(const Icon(
            Icons.check, color: Colors.green, size: 22,));
        }
        else {
          showIcons.add(const Icon(
            Icons.close, color: Colors.red, size: 22,));
        }
      }
      newQuizBrain.nextQuestion();
      });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey.shade900,
          body: SafeArea(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Column(
                  children: [
                    Expanded(
                        flex: 5,
                        child: Center(
                          child: Text(
                            newQuizBrain.getQuestion(),
                             style: const TextStyle(color: Colors.white, fontSize: 27),
                            textAlign: TextAlign.center,
                          ),
                        )
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 350,
                            height: 30,
                            child: TextButton(
                              onPressed: (){
                                    checkAnswers(true);
                              },
                              style: TextButton.styleFrom(backgroundColor: Colors.green),
                              child: const Text('True',style: TextStyle(fontSize: 25,color: Colors.white)),
                            ),
                          ),
                        )
                    ),
                    Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: SizedBox(
                            width: 350,
                            height: 30,
                            child: TextButton(
                              onPressed: (){
                                      checkAnswers(false);
                              },
                              style: TextButton.styleFrom(backgroundColor: Colors.red),
                              child: const Text('False',style: TextStyle(fontSize: 25,color: Colors.white)),
                            ),
                          ),
                        )
                    ),
                    Row(
                      children: showIcons,
                    )
                  ],
                )
            ),
          )
      ),
    );
  }
}




