import 'package:using_sqlite/database_helper.dart';
import 'package:using_sqlite/models/person_model.dart';

class PersonsDao {
  static Future<List<PersonModel>> allPersons() async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM persons',
    );

    return List.generate(maps.length, (index) {
      final allMaps = maps[index]; //dolaşılan

      return PersonModel(
        person_id: allMaps['person_id'],
        person_name: allMaps['person_name'],
        person_age: allMaps['person_age'],
      );
    });
  }

  static Future<void> addPerson(String name, int age) async {
    final db = await DatabaseHelper.accessToDatabase();

    Map<String, dynamic> map = {'person_name': name, 'person_age': age};
    await db.insert('persons', map);
  }

  static Future<void> deletePerson(int id) async {
    final x = await DatabaseHelper.accessToDatabase();

    await x.delete(
      'persons',
      where: 'person_id = ?',
      whereArgs: [id],
    ); // ? = placeholder
  }

  static Future<void> update(int id, String name, int age) async {
    final x = await DatabaseHelper.accessToDatabase();

    Map<String, dynamic> map = {};
    map['person_name'] = name;
    map['person_age'] = age;

    await x.update('persons', map, where: 'person_id = ?', whereArgs: [id]);
  }

  static Future<int> count(String name) async {
    final d = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> maps = await d.rawQuery(
      'SELECT count(*) AS Result FROM persons WHERE person_name="$name"',
    );

    print(maps);

    return maps[0]['Result'];
  }

  static Future<PersonModel> takeOne(int x) async {
    final d = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> maps = await d.rawQuery(
      'SELECT * FROM persons WHERE person_id=$x',
    );

    final i = maps[0];

    return PersonModel(
      person_id: i['person_id'],
      person_name: i['person_name'],
      person_age: i['person_age'],
    );
  }

  static Future<List<PersonModel>> random() async {
    final d = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> x = await d.rawQuery(
      'SELECT * FROM persons ORDER BY RANDOM() LIMIT 2',
    );

    return x.map((e) {
      return PersonModel(
        person_id: e['person_id'],
        person_name: e['person_name'],
        person_age: e['person_age'],
      );
    }).toList();
  }

  static Future<List<PersonModel>> filtered(String text) async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> data = await db.rawQuery(
      'SELECT * FROM persons WHERE person_name like "%$text%"',
    );

    return List.generate(data.length, (index) {
      var x = data[index];
      return PersonModel(
        person_id: x['person_id'],
        person_name: x['person_name'],
        person_age: x['person_age'],
      );
    });
  }
}
