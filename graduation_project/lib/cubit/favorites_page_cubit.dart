import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/food_model.dart';

class FavoritesPageCubit extends Cubit<List<FoodModel>> {
  FavoritesPageCubit() : super(<FoodModel>[]);

  Future<void> addFavorite(FoodModel f1) async {
    final list = List<FoodModel>.from(state);
    if (!list.contains(f1)) {
      list.add(f1);
      emit(list);
    }
  }
}
