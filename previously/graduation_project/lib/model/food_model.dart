import 'package:flutter/foundation.dart';

class FoodModel {
  String yemek_id;
  String yemek_adi;
  String yemek_resim_adi;
  String yemek_fiyat;

  FoodModel({
    required this.yemek_id,
    required this.yemek_adi,
    required this.yemek_resim_adi,
    required this.yemek_fiyat,
  });

  factory FoodModel.fromJson(Map<String, dynamic> jsonData) {
    return FoodModel(
      yemek_id: jsonData['yemek_id'] as String,
      yemek_adi: jsonData['yemek_adi'] as String,
      yemek_resim_adi: jsonData['yemek_resim_adi'] as String,
      yemek_fiyat: jsonData['yemek_fiyat'] as String,
    );
  }
}
