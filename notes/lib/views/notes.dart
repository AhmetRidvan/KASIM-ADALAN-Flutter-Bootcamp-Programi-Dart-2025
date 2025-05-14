import 'package:flutter/material.dart';
import 'package:notes/model/noteModel.dart';
import 'package:notes/views/notes_details.dart';
import 'package:notes/views/notes_record.dart';

class Notes extends StatefulWidget {
  const Notes({super.key});

  @override
  State<Notes> createState() => _NotesState();
}

class _NotesState extends State<Notes> {
  Future<void> exit() async {
    await exit();
  }

  Future<List<Notemodel>> getAllNotes() async {
    final notesList = <Notemodel>[];

    final e1 = Notemodel(
      note_id: 1,
      lesson_name: 'History',
      grade1: 33,
      grade2: 100,
    );

    final e2 = Notemodel(
      note_id: 2,
      lesson_name: 'Math',
      grade1: 50,
      grade2: 80,
    );

    final e3 = Notemodel(
      note_id: 4,
      lesson_name: 'Geometry',
      grade1: 90,
      grade2: 65,
    );

    notesList.addAll([e1, e2, e3]);

    return notesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Notes app', style: TextStyle(fontSize: 16)),
            FutureBuilder(
              future: getAllNotes(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  List<Notemodel> data = snapshot.data!;
                  if (data.isNotEmpty) {
                    double total = 0.0;
                    double result = 0.0;

                    for (final x in data) {
                      total = total + (x.grade1 + x.grade2 / 2);
                    }
                    result = total / data.length;

                    return Text(
                      result.toInt().toString(),

                      style: TextStyle(fontSize: 16),
                    );
                  } else {
                    return Text('Average : 0', style: TextStyle(fontSize: 16));
                  }
                } else {
                  return CircularProgressIndicator();
                }
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: FutureBuilder(
        future: getAllNotes(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var data = snapshot.data;
            return ListView.builder(
              itemCount: data!.length,
              itemBuilder: (context, index) {
                final note = data[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return NotesDetails(n1: note);
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    height: 60,
                    child: Card(
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              note.lesson_name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              note.grade1.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              note.grade2.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) {
                return NotesRecord();
              },
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
