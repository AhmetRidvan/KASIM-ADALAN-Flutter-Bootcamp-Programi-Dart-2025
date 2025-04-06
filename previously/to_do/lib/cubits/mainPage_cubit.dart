import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/model/todo_model.dart';
import 'package:to_do/repository/repo.dart';

class MainPageCubit extends Cubit<List<TodoModel>> {
  MainPageCubit() : super(<TodoModel>[]);

  Repo r1 = Repo();

  Future<void> getToDoList() async {
    emit(await r1.getAll());
    print(await r1.getAll());
  }

  Future<void> filter(String text) async {
    emit(await r1.filter(text));

  }

  Future<void> delete(int id) async {
    r1.delete(id);
    emit(await r1.getAll());
  }
}
