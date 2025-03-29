import 'package:flutter/material.dart';
import 'package:kisiler_app/ui/views/anasayfa.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Anasayfa()
    );
  }
}