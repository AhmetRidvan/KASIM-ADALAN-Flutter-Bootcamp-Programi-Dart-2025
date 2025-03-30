import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  DetaySayfa({super.key,required this.f1});

  Filmmodel f1; //15:41

  @override
  State<DetaySayfa> createState() {
    return _anaSayfa();
  }
}

class _anaSayfa extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('film adı')), body: Center());
  }
}
