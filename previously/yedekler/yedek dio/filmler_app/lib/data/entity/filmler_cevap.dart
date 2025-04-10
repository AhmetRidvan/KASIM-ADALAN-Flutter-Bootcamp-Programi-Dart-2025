import 'package:filmler_app/data/entity/filmModel.dart';

class FilmlerCevap {
  List<FilmModel> filmler;
  int success;

  FilmlerCevap({required this.filmler, required this.success});

  factory FilmlerCevap.fromJson(Map<String, dynamic> jsonData) {
    final jsonFilm = jsonData['filmler'] as List;
    final jsonSuccess = jsonData['success'] as int;
    final x = jsonFilm.map((e) {
      return FilmModel.fromJson(e);
    }).toList();
    return FilmlerCevap(filmler: x, success: jsonSuccess);
  }
}
