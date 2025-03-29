import 'package:flutter/material.dart';
import 'package:urunler_app/ui/views/anasayfa.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget { //9:55
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Anasayfa(),
    );
  }
}