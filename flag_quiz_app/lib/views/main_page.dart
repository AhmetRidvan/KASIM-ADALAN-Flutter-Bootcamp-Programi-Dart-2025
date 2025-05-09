import 'package:flag_quiz_app/views/quiz_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Welcome to quiz', style: TextStyle(fontSize: 30)),
            SizedBox(
              width: 300,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return QuizPage();
                      },
                    ),
                  );
                },
                child: Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
