import 'package:graduation_project/model/food_model.dart';

class FoodsModel {
  List<FoodModel> foods;
  int success;

  FoodsModel({required this.foods, required this.success});

  factory FoodsModel.fromJson(Map<String, dynamic> JsonData) {
    final list = JsonData['yemekler'] as List;
    final success = JsonData['success'] as int;
    final items =
        list.map((e) {
          return FoodModel.fromJson(e);
        }).toList();

    return FoodsModel(foods: items, success: success);
  }
}
