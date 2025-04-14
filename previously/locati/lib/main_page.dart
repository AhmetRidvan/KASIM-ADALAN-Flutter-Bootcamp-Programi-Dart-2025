import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() {
    return _MainPage();
  }
}

class _MainPage extends State<MainPage> {
  double lat = 0.0;
  double long = 0.0;

  Future<void> takeLocationInformation()async{
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("use location")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("lang :", style: TextStyle(fontSize: 30)),
            Text("Long :", style: TextStyle(fontSize: 30)),
            ElevatedButton(onPressed: () {}, child: Text("Use the location")),
          ],
        ),
      ),
    );
  }
}
