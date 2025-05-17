import 'package:flag_quiz_app/database_helper.dart';
import 'package:flag_quiz_app/models/flag_model.dart';

class FlagsDao {
  static Future<List<FlagModel>> bringTheFlags5() async {
    var db = await DatabaseHelper.AccessToDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM flags ORDER BY RANDOM() LIMIT 5',
    );

    return List.generate(maps.length, (index) {
      // soru olarak kullanıcaz
      var x = maps[index];
      return FlagModel(
        flag_id: x['flag_id'],
        flag_name: x['flag_name'],
        flag_image: x['flag_image'],
      );
    });
  }

  static Future<List<FlagModel>> bringTheWrongFlags3(int trueId) async {
    final db = await DatabaseHelper.AccessToDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM flags WHERE flag_id != $trueId ORDER BY RANDOM() LIMIT 3',
    );

    return maps.map((e) {
      return FlagModel(
        flag_id: e['flag_id'],
        flag_name: e['flag_name'],
        flag_image: e['flag_image'],
      );
    }).toList();
  }
}
