import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:graduation_project/model/basket_item_model.dart';
import 'package:graduation_project/model/basket_model.dart';

import 'package:graduation_project/model/food_model.dart';
import 'package:graduation_project/model/foods_model.dart';

class Repo {
  Future<List<FoodModel>> getfoods() async {
    final url = 'http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php';
    Response x = await Dio().get(url);

    return FoodsModel.fromJson(jsonDecode(x.data)).foods;
  }

  Future<void> addBasket(
    String yemek_adi,
    String yemek_resim_adi,
    int yemek_fiyat,
    int yemek_siparis_adet,
    String kullanici_adi,
  ) async {
    final map = {
      "yemek_adi": yemek_adi,
      "yemek_resim_adi": yemek_resim_adi,
      "yemek_fiyat": yemek_fiyat,
      "yemek_siparis_adet": yemek_siparis_adet,
      "kullanici_adi": kullanici_adi,
    };
    final x = await Dio().post(
      "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php",
      data: FormData.fromMap(map),
    );
  }

  Future<List<BasketItemModel>> getBasketItems(String kullanici_adi) async {
    final map = {'kullanici_adi': kullanici_adi};
    final x = await Dio().post(
      'http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php',
      data: FormData.fromMap(map),
    );


     if (x.data == null || x.data.toString().isEmpty) {
    print("Boş veya geçersiz veri döndü");
    return []; // Boş bir liste döndür
  }

  try {
    // JSON'u parse et
    return BasketModel.fromJson(jsonDecode(x.data)).list;
  } catch (e) {
    print("JSON parse hatası: $e");
    return []; // Hata durumunda boş bir liste döndür
  }
  }

  Future<void> delete(int yemekId, String kullaniciAdi) async {
    final url = "http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php";
    Map<String, dynamic> map = {
      'sepet_yemek_id': yemekId,
      'kullanici_adi': kullaniciAdi,
    };
    final x = await Dio().post(url, data: FormData.fromMap(map));
  }
}
