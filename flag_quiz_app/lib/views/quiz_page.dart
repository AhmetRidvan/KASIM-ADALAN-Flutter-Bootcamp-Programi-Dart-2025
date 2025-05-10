import 'dart:collection';

import 'package:flag_quiz_app/flag_dao.dart';
import 'package:flag_quiz_app/models/flag_model.dart';
import 'package:flag_quiz_app/views/result_page.dart';
import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<FlagModel> questions = [];
  List<FlagModel> wrongOptions = [];
  late FlagModel trueQuestion;
  final allOptions = HashSet<FlagModel>();
  int questionCount = 0;
  int trueCount = 0;
  int wrongCount = 0;

  String flagImageName = 'placeholder.png';
  String buttonAText = '';
  String buttonBText = '';
  String buttonCText = '';
  String buttonDText = '';

  @override
  void initState() {
    bringTheQuestions();
    super.initState();
  }

  Future<void> bringTheQuestions() async {
    questions = await FlagsDao.bringTheFlags5();
    
    loadTheQuestions();
  }

  Future<void> loadTheQuestions() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("True : 1", style: TextStyle(fontSize: 18)),
                Text("False : 1", style: TextStyle(fontSize: 18)),
              ],
            ),
            Text("1.Question", style: TextStyle(fontSize: 30)),
            Image.asset('assets/turkiye.png'),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) {
                        return ResultPage(numberOfCorrect: 3);
                      },
                    ),
                  );
                },
                child: Text('Button A'),
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(onPressed: () {}, child: Text('Button B')),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(onPressed: () {}, child: Text('Button C')),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(onPressed: () {}, child: Text('Button D')),
            ),
          ],
        ),
      ),
    );
  }
}
