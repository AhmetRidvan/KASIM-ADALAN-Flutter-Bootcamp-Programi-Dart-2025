import 'package:graduation_project/model/basket_item_model.dart';

class BasketModel {
  List<BasketItemModel> list;
  int success;

  BasketModel({required this.list, required this.success});

  factory BasketModel.fromJson(Map<String, dynamic> jsonData) {
    final suc = jsonData['success'] as int;
    final list = jsonData['sepet_yemekler'] as List;

    final x = list.map((e) {
      return BasketItemModel.fromJson(e);
    }).toList();

    return BasketModel(list: x, success: suc);
  }
}
