import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int finalScore;
  final Function resetBtnHandler;

  Result(this.finalScore, this.resetBtnHandler);

  String get resultPhrase {
    String resultText;

    if (finalScore <= 8) {
      resultText = "You are awesome and innocent!";
    } else if (finalScore <= 12) {
      resultText = "Pretty likeable!";
    } else if (finalScore <= 16) {
      resultText = "You are... strange?!";
    } else {
      resultText = "You are so bad!";
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // for column
        // crossAxisAlignment: CrossAxisAlignment.center, // for row maybe...
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(
            "Your Score: $finalScore",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Container(
            child: RaisedButton(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "Play again",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: resetBtnHandler,
            ),
            margin: EdgeInsets.all(20),
          )
        ],
      ),
    );
  }
}
