import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';

class KayitsayfaCubit extends Cubit<void> {
  KayitsayfaCubit() : super(0);
  KisilerdaoRepository k1 = KisilerdaoRepository();

  Future<void> save(String kisi_ad, String kisi_tel) async {
    await k1.save(kisi_ad, kisi_tel);
  }
}
