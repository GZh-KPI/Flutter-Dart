import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Ваш улюблений колір?',
      'answers': [
        {'text': 'Чорний', 'score': 10},
        {'text': 'Червоний', 'score': 5},
        {'text': 'Білий', 'score': 3},
        {'text': 'Жовтий', 'score': 1},
      ],
    },
    {
      'questionText': 'Ваша улюблена домашня тварина?',
      'answers': [
        {'text': 'Кролик', 'score': 3},
        {'text': 'Кіт', 'score': 11},
        {'text': 'Пес', 'score': 5},
        {'text': 'Папуга', 'score': 9},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('Залишилось ще кілька питань!');
    } else {
      print('Ура! Вікторина пройдена!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Text(
              'Георгій Журахівський: Вікторина',
              style: new TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
            ),
            backgroundColor: Colors.blue[300],
            toolbarHeight: 100),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
