import 'package:flutter/material.dart';
import 'package:urunler_app/data/entity/urunler.dart';

class DetaySayfa extends StatefulWidget {
  DetaySayfa({super.key, required this.urunModel});

  UrunModel urunModel;

  @override
  State<DetaySayfa> createState() {
    return _Anasayfa();
  }
}

class _Anasayfa extends State<DetaySayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.urunModel.ad)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                height: 200,
                width: 200,
                'images/${widget.urunModel.resim}',
              ),
            ),
            Text(
              '${widget.urunModel.fiyat} ₺',
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
