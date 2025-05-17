import 'package:movies/database_helper.dart';
import 'package:movies/models/category_model.dart';

class CategoryDao {
  static Future<List<CategoryModel>> bringItAll() async {
    var list = <CategoryModel>[];
    final db = await DatabaseHelper.accessToDatabase();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM categories',
    );

    list =
        maps.map((e) {
          print('Kategory $e');
          return CategoryModel(
            category_id: e['category_id'],
            category_name: e['category_name'],
          );
        }).toList();

    return list;
  }
}
