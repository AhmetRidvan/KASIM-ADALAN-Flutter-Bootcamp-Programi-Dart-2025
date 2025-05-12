import 'package:dictionary/word_model.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.w1});

  WordModel w1;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              widget.w1.english,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50,
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              widget.w1.turkish,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      appBar: AppBar(title: Text('Details')),
    );
  }
}
