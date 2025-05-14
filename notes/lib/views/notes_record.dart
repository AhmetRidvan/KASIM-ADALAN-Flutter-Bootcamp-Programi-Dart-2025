import 'package:flutter/material.dart';
import 'package:notes/views/notes.dart';

class NotesRecord extends StatefulWidget {
  const NotesRecord({super.key});

  @override
  State<NotesRecord> createState() => _NotesRecordState();
}

class _NotesRecordState extends State<NotesRecord> {
  final tLessonName = TextEditingController();
  final tGrade1 = TextEditingController();
  final tGrade2 = TextEditingController();

  Future<void> save(String className, int grade1, int grade2) async {
    print('$className $grade1 $grade2 kaydedildi');
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Note record'),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tLessonName,
                decoration: InputDecoration(hintText: 'Lesson name'),
              ),
              TextField(
                controller: tGrade1,
                decoration: InputDecoration(hintText: 'Grade 1'),
              ),
              TextField(
                controller: tGrade2,
                decoration: InputDecoration(hintText: 'Grade 2'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          save(
            tLessonName.text,
            int.parse(tGrade1.text),
            int.parse(tGrade2.text),
          );
        },
        icon: Icon(Icons.save),
        label: Text('Save'),
      ),
    );
  }
}
