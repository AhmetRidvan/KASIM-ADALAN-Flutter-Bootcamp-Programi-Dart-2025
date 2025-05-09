import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //8:21
  final t1 = TextEditingController();
  Future<void> writeData() async {
    final forPath = await getApplicationDocumentsDirectory(); // erişim izni
    final path = forPath.path; //dosya yolu

    final file = File('${path}/myfile.txt');
    file.writeAsString(t1.text);
    print('wr');
    
      t1.text = '';
    
  }

  Future<void> readData() async {
    try {
      final permission = await getApplicationDocumentsDirectory();

      final path = await permission.path;

      final x = File('$path/myfile.txt');

      final comingText =  x.readAsStringSync(); 

      t1.text = comingText;
    } catch (e) {
      e.toString();
    }
  }

  Future<void> delete() async {
    try {
      final p = await getApplicationDocumentsDirectory();
      final path = p.path;
      final f = File('${path}/myfile.txt');
      if (f.existsSync()) {
        await f.delete(); 
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text('Path_provider')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(controller: t1,
                  decoration: InputDecoration(hintText: 'Enter your data'),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      writeData();
                    },
                    child: Text('Write'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      readData();
                    },
                    child: Text('Read'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      delete();
                    },
                    child: Text('Delete'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
