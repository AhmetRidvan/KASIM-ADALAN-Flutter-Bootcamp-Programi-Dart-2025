import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:filmler_app/data/entity/filmler_cevap.dart';

class FilmlerdaoRepository {
  //15:14
  List<FilmModel> filmler(String text) {
    return FilmlerCevap.fromJson(jsonDecode(text)).filmler;
  }

  Future<List<FilmModel>> filmleriYukle() async {
    //15:14
    var url = 'http://kasimadalan.pe.hu/filmler_yeni/tum_filmler.php';
    var response = await Dio().get(url);
    return FilmlerCevap.fromJson(jsonDecode(response.data)).filmler;
  }
}
