import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:filmler_app/repository/filmlerdao_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<List<FilmModel>> {
  AnasayfaCubit() : super(<FilmModel>[]);

  FilmlerdaoRepository f1 = FilmlerdaoRepository();

  Future<void> filmleriYukle() async {
    emit(await f1.filmleriYukle());
  }
}
