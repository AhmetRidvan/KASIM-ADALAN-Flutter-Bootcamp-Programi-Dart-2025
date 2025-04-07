import 'package:flutter/material.dart';
import 'package:pos_projesi/ui/login_sign.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 17, 252),
        ),
      ),
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: LoginSign(),
    );
  }
}
