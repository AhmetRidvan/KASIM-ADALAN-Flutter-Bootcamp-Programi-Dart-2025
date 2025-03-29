import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  DetaySayfa({super.key});

  @override
  State<DetaySayfa> createState() {
    return _Anasayfa();
  }
}

class _Anasayfa extends State<DetaySayfa>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar( title: Text('Detay sayfa'),),
      body: Center(),
    );
  }
}