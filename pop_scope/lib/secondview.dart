import 'package:flutter/material.dart';

class Secondview extends StatefulWidget {
  const Secondview({super.key});

  @override
  State<StatefulWidget> createState() {
    return _secondView();
  }
}

class _secondView extends State<Secondview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        onPopInvokedWithResult: (didPop, result) {
          print('didpop  $didPop');
          print('result $result');
        },
        canPop: true,
        child: Center(child: Text("Hello")),
      ),
    );
  }
}
