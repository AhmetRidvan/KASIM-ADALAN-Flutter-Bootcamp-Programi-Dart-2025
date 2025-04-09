import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/data/entity/kisiler_cevap.dart';

class KisilerdaoRepository {
  List<Kisiler> parsedKisiler(String url) {
    return KisilerCevap.fromJson(jsonDecode(url)).kisiler;
  }

  Future<void> save(String kisi_ad, String kisi_tel) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/insert_kisiler.php';
    var map = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(map));
    print(cevap.toString());
  }

  Future<void> update(int kisi_id, String kisi_ad, String kisi_tel) async {
    final url = 'http://kasimadalan.pe.hu/kisiler/update_kisiler.php';
    final map = {'kisi_id': kisi_id, 'kisi_ad': kisi_ad, 'kisi_tel': kisi_tel};
    final cevap = await Dio().post(url, data: FormData.fromMap(map));
    print(cevap);
  }

  Future<List<Kisiler>> getPeople() async {
    var url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler.php';
    var response = await Dio().get(url);
    return parsedKisiler(response.data);
  }

  Future<void> delete(int kisi_id) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/delete_kisiler.php';
    var map = {"kisi_id": kisi_id};
    var cevap = await Dio().post(url, data: FormData.fromMap(map));
    print(cevap);
  }

  Future<List<Kisiler>> call(String name) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php';
    var map = {"kisi_ad": name};
    var cevap = await Dio().post(url, data: FormData.fromMap(map));
    print(cevap.data);
    return parsedKisiler(cevap.data);
  }
}
