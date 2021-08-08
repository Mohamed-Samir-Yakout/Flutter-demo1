import 'package:flutter/material.dart';
import './trial.dart';

class Result extends StatelessWidget {
  final Function resetHandler;
  Result(this.resetHandler);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text(
              'The end',
              style: TextStyle(color: Colors.blue, fontSize: 24),
            ),
            FlatButton(
              onPressed: resetHandler,
              child: Text(
                'reset!',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
              textColor: Colors.red,
            )
          ],
        ),
      ),
    );
  }
}
