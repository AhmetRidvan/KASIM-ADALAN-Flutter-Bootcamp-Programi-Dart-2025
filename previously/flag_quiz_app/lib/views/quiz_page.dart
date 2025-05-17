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
  List<FlagModel> flags = [];
  List<FlagModel> falseFlags = [];
  late FlagModel trueFlag;
  final allFlagsForButtons = HashSet<FlagModel>();
  int count = 0;
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
    flags = await FlagsDao.bringTheFlags5();
    for (final x in flags) {
      print('questions ${x.flag_id} ${x.flag_image} ${x.flag_name}');
    }
    loadTheQuestions();
  }

  Future<void> loadTheQuestions() async {
    trueFlag = flags[count];

    flagImageName = "${trueFlag.flag_name.toLowerCase()}.png";
   
    falseFlags = await FlagsDao.bringTheWrongFlags3(trueFlag.flag_id);

    allFlagsForButtons.clear();
    allFlagsForButtons.add(trueFlag);
    allFlagsForButtons.add(falseFlags[0]);
    allFlagsForButtons.add(falseFlags[1]);
    allFlagsForButtons.add(falseFlags[2]);

    buttonAText = allFlagsForButtons.elementAt(0).flag_name;
    buttonBText = allFlagsForButtons.elementAt(1).flag_name;
    buttonCText = allFlagsForButtons.elementAt(2).flag_name;
    buttonDText = allFlagsForButtons.elementAt(3).flag_name;
    setState(() {});
  }

  void countControl() {
    count++;
    if (count != 5) {
      loadTheQuestions();
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return ResultPage(numberOfCorrect: trueCount);
          },
        ),
      );
    }
  }

  void trueControl(String buttonText) {
    if (trueFlag.flag_name == buttonText) {
      trueCount++;
    } else {
      wrongCount++;
    }
  }

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
                Text("True : $trueCount", style: TextStyle(fontSize: 18)),
                Text("False : $wrongCount", style: TextStyle(fontSize: 18)),
              ],
            ),
            count != 5
                ? Text("${count + 1}.Question", style: TextStyle(fontSize: 30))
                : Text("5.Question", style: TextStyle(fontSize: 30)),
            Image.asset('assets/${flagImageName}'),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  trueControl(buttonAText);
                  countControl();
                },
                child: Text(buttonAText),
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  trueControl(buttonBText);
                  countControl();
                },
                child: Text(buttonBText),
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  trueControl(buttonCText);
                  countControl();
                },
                child: Text(buttonCText),
              ),
            ),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  trueControl(buttonDText);
                  countControl();
                },
                child: Text(buttonDText),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
