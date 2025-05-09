import 'package:sqlite_foreignkey/database_helper.dart';
import 'package:sqlite_foreignkey/filmler.dart';
import 'package:sqlite_foreignkey/kategoriler.dart';
import 'package:sqlite_foreignkey/yonetmenler.dart';

class Filmlerdao {
  static Future<List<Filmler>> allFilms() async {
    final d = await DatabaseHelper.databaseHelper();
    List<Map<String, dynamic>> x = await d.rawQuery(
      "SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id",
    );

    return List.generate(x.length, (index) {
      var items = x[index];

      final k = Kategoriler(
        kategori_id: items['kategori_id'],
        kategori_ad: items['kategori_ad'],
      );

      final y = Yonetmenler(
        yonetmen_id: items['yonetmen_id'],
        yonetmen_ad: items['yonetmen_ad'],
      );
      print(items);
      return Filmler(
        film_id: items['film_id'],
        film_ad: items['film_ad'],
        film_yil: items['film_yil'],
        film_resim: items['film_resim'],
        kategoriler: k,
        yonetmenler: y,
      );
    });
  }
}
