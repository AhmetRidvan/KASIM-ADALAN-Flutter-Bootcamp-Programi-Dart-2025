import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]);

  KisilerdaoRepository k1 = KisilerdaoRepository();

  Future<void> getPeople() async {
    emit(await k1.getPeople());//23:54
  }
}
