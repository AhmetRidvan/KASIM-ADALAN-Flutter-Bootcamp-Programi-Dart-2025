import 'package:flutter/material.dart';
import 'package:locati/ui/main_page.dart';
import 'package:locati/ui/map_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: MapPage()
    );
  }
}