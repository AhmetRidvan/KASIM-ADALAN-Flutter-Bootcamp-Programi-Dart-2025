import 'package:dictionary/database/database_helper.dart';
import 'package:dictionary/word_model.dart';

class WordDao {
  static Future<List<WordModel>> allWord() async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM words');

    return List.generate(maps.length, (index) {
      final x = maps[index];

      return WordModel(
        word_id: x['word_id'],
        english: x['english'],
        turkish: x['turkish'],
      );
    });
  }

  static Future<List<WordModel>> search(String searchWord) async {
    final db = await DatabaseHelper.accessToDatabase();

    List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM words WHERE english like "%$searchWord%"');

    return List.generate(maps.length, (index) {
      final x = maps[index];

      return WordModel(
        word_id: x['word_id'],
        english: x['english'],
        turkish: x['turkish'],
      );
    });
  }
}
