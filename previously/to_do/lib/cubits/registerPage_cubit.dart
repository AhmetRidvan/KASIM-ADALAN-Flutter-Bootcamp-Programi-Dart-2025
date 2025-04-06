import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/model/todo_model.dart';
import 'package:to_do/repository/repo.dart';

class RegisterPageCubit extends Cubit<List<TodoModel>> {
  RegisterPageCubit() : super(<TodoModel>[]);

  Repo r1 = Repo();

  Future<void> save(String title, String text) async {
    await r1.save(title, text);
    emit(await r1.getAll());
  }
}
