import 'package:flag_quiz_app/database_helper.dart';
import 'package:flag_quiz_app/models/flag_model.dart';

class FlagsDao {
  Future<List<FlagModel>> bringTheFlags5() async {
    var db = await DatabaseHelper.AccessToDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM flags ORDER BY RANDOM() LIMIT 5',
    );

    return List.generate(maps.length, (index) {
      var x = maps[index];
      return FlagModel(
        flag_id: x['flag_id'],
        flag_name: x['flag_name'],
        flag_image: x['flag_image'],
      );
    });
  }



}
