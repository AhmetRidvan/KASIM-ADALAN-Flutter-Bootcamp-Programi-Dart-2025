import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/model/todo_model.dart';
import 'package:to_do/repository/repo.dart';

class UpgradePageCubit extends Cubit<List<TodoModel>> {
  UpgradePageCubit() : super(<TodoModel>[]);

  Repo r1 = Repo();

  Future<void> upgrade(int id, String title, String text) async {
    r1.update(id, title, text);
  }
}
