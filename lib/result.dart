import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    String resultText;
    if (resultScore >= 10) {
      resultText = 'Маєш високий результат!';
    } else if (resultScore >= 16) {
      resultText = 'Вау! Ти просто супер!';
    } else {
      resultText = 'Результати низькі. Але засмучуватись не варто!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text(
              'Пройти ще раз',
            ),
            textColor: Colors.blue[300],
            onPressed: resetHandler,
          ),
        ],
      ),
    );
  }
}
