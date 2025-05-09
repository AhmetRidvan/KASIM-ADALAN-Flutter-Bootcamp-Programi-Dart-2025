import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/food_model.dart';
import 'package:graduation_project/model/foods_model.dart';
import 'package:graduation_project/repo/repo.dart';

class MainPageCubit extends Cubit<List<FoodModel>> {
  MainPageCubit() : super(<FoodModel>[]);

  final r1 = Repo();

  Future<List<FoodModel>> getFoods() async {
    emit(await r1.getfoods());
    return await r1.getfoods();
  }
}
