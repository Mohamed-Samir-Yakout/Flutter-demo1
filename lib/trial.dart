import 'package:demo1/answer.dart';
import 'package:demo1/question.dart';
import 'package:flutter/material.dart';

import 'quiz.dart';
import './result.dart';

//void main ()=> runApp(MyNewApp());
class MyNewApp extends StatefulWidget {
  @override
  _MyNewAppState createState() => _MyNewAppState();
}

class _MyNewAppState extends State<MyNewApp> {
  int _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'question': 'what is your favorite color?!',
        'answers': ['blue', 'red', 'green']
      },
      {
        'question': 'what is your favorite animal?!',
        'answers': ['snake', 'lion', 'elephant', 'puma']
      },
      {
        'question': 'who is your favorite instructor?!',
        'answers': ['julie', 'nancy', 'max']
      }
    ];

    void _answerQuestion() {
      setState(() {
        if (_questionIndex < _questions.length) {
          _questionIndex++;
        }
      });
      print('Question answered');
    }

    void Reset() {
      setState(() {
        _questionIndex = 0;
      });
    }

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my new app'),
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _questionIndex < _questions.length
                ? Quiz(
                    answerQuestion: _answerQuestion,
                    questionIndex: _questionIndex,
                    questions: _questions,
                  )
                : Result(Reset)),
      ),
    );
  }
}
