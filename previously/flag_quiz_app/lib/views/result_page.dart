import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  ResultPage({super.key, this.numberOfCorrect});

  int? numberOfCorrect;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Result page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${widget.numberOfCorrect} True-${5 - widget.numberOfCorrect!} False",
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "% ${((widget.numberOfCorrect! * 100) / 5).toInt()} Success",
              style: TextStyle(fontSize: 30, color: Colors.pinkAccent),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Try again!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
