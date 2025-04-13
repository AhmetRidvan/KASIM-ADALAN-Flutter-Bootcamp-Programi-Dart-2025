import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:filmler_app/sqlite/veritabani_yardimcisi.dart';

class FilmlerdaoRepository {
  Future<List<FilMmodel>> filmleriYukle() async {
    final db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> listOfMaps = await db.rawQuery(
      'SELECT * FROM filmler',
    ); // her bir satır map id : 1, ad : django...
    return listOfMaps.map((e) {
      return FilMmodel(
        id: e['id'],
        ad: e['ad'],
        resim: e['resim'],
        fiyat: e['fiyat'],
      );
    }).toList();
  }
}
