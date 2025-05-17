import 'package:notes/database/DatabaseHelper.dart';
import 'package:notes/model/noteModel.dart';

class Dao {
  static Future<List<Notemodel>> bringItAll() async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT * FROM notes',
    );
    for (final x in listOfMaps) {
      print('${x.keys} ${x.values}');
    }

    return List.generate(listOfMaps.length, (index) {
      final data = listOfMaps[index];
      return Notemodel(
        note_id: data['note_id'],
        lesson_name: data['lesson_name'],
        grade1: data['grade1'],
        grade2: data['grade2'],
      );
    });
  }

  static Future<void> addNote(String lessonName, int no1, int not2) async {
    final db = await DatabaseHelper.accessToDatabase();

    final map = <String, dynamic>{};
    map['lesson_name'] = lessonName;
    map['grade1'] = no1;
    map['grade2'] = not2;
    print(map);

    db.insert('notes', map);
  }

  static Future<void> upgrade(
    int noteId,
    String lessonName,
    int no1,
    int not2,
  ) async {
    final db = await DatabaseHelper.accessToDatabase();

    final map = <String, dynamic>{};
    map['lesson_name'] = lessonName;
    map['grade1'] = no1;
    map['grade2'] = not2;
    print(map);

    await db.update('notes', map, where: 'note_id = ?', whereArgs: [noteId]);
  }

  static Future<void> delete(int notId) async {
    final d = await DatabaseHelper.accessToDatabase();
    await d.delete('notes', where: 'note_id = ?', whereArgs: [notId]);
  }
}
