import 'package:to_do/model/todo_model.dart';
import 'package:to_do/veri_tabani_yardimcisi/veri_tabani_yardimcisi.dart';

class Repo {
  Future<List<TodoModel>> getAll() async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT * FROM todo',
    );
    return List.generate(listOfMaps.length, (index) {
      final x = listOfMaps[index];
      return TodoModel(id: x['id'], title: x['title'], text: x['text']);
    });
  }

  Future<void> save(String title, String text) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    Map<String, dynamic> map = {};
    map['title'] = title;
    map['text'] = text;
    await db.insert('todo', map);
  }

  Future<void> delete(int id) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete('todo', where: 'id = ?', whereArgs: [id]);
  }

  Future<void> update(int id, String title, String text) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    final x = <String, dynamic>{};
    x['id'] = id;
    x['text'] = text;
    x['title'] = title;

    await db.update('todo', x, where: 'id = ?', whereArgs: [id]);
    print(x);
  }

  Future<List<TodoModel>> filter(String text) async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> liste = await db.rawQuery(
      "SELECT * FROM todo WHERE title like '%$text%'",
    );
    return List.generate(liste.length, (index) {
      var x = liste[index];
      return TodoModel(id: x['id'], title: x['title'], text: x['text']);
    });
  }
}
