import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';

class AnasayfaCubit extends Cubit<List<Kisiler>> {
  AnasayfaCubit() : super(<Kisiler>[]);

  KisilerdaoRepository k1 = KisilerdaoRepository();

  Future<void> getPeople() async {
    emit(await k1.getPeople()); //23:54.
  }

  Future<void> ara(String name) async {
    emit(await k1.call(name));
  }

  Future<void> delete(int kisi_id) async {
    await k1.delete(kisi_id);
    await getPeople();
  }
}
