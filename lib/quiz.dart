import 'package:flutter/material.dart';

import 'answer.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function answerQuestion;
  final int questionIndex;

  Quiz({this.answerQuestion, this.questionIndex, this.questions});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(questionText: questions[questionIndex]['question']),

        //////mapping a list/////////////////
        //...(questions[questionIndex]['answers'] as List<String>)
        //    .map((answer) {
        //  return Answer(
        //    answerText: answer,
        //  selectHandler: answerQuestion,
        //   );
        // }).toList(),

/////// another method to map a list using  listview.builder//////////
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount:
              (questions[questionIndex]['answers'] as List<String>).length,
          itemBuilder: (BuildContext context, int index) {
            return Answer(
              selectHandler: answerQuestion,
              answerText:
                  (questions[questionIndex]['answers'] as List<String>)[index],
            );
          },
        ),
      ],
    );
  }
}
