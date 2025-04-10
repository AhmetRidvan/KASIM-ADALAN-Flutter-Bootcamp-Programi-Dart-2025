import 'dart:convert';

class FilmModel {
  int id;
  String ad;
  String resim;
  int fiyat;
  FilmModel({
    required this.id,
    required this.ad,
    required this.resim,
    required this.fiyat,
  });

  factory FilmModel.fromJson(Map<String, dynamic> jsonData) {
    return FilmModel(
      id: jsonData['id'] as int,
      ad: jsonData['ad'] as String,
      resim: jsonData['resim'] as String,
      fiyat: jsonData['fiyat'] as int,
    );
  }
}
