import 'package:movies/database_helper.dart';
import 'package:movies/models/movie_model.dart';

class MovieDao {
  static Future<List<MovieModel>> bringItAll(int category_id) async {
    var list = <MovieModel>[];
    final db = await DatabaseHelper.accessToDatabase();
    print('hi');
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM categories,directors,movies WHERE movies.category_id = categories.category_id and movies.director_id = directors.director_id and movies.category_id = $category_id',
    );

    return list;
  }
}
