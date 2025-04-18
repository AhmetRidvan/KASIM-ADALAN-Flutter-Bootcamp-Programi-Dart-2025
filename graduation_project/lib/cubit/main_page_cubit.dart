import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/model/foods_model.dart';
import 'package:graduation_project/repo/repo.dart';

class MainPageCubit extends Cubit<List<FoodsModel>> {
  MainPageCubit() : super(<FoodsModel>[]);

  final r1 = Repo();

  Future<void> getFoods() async {
    r1.deneme();
  }
}
