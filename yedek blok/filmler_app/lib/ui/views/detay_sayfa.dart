import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:flutter/material.dart';

class DetaySayfa extends StatefulWidget {
  DetaySayfa({super.key, required this.f1});

  Filmmodel f1; //15:41

  @override
  State<DetaySayfa> createState() {
    return _anaSayfa();
  }
}

class _anaSayfa extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.f1.ad)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('images/${widget.f1.resim}', fit: BoxFit.cover),
            Text(
              '${widget.f1.fiyat} ₺',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
