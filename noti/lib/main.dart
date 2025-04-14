import 'package:flutter/material.dart';
import 'package:noti/main_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: MainPage(), //14:47
    );
  }
}