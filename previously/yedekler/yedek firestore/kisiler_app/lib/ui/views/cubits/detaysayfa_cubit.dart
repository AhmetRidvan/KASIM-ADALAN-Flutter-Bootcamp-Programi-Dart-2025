import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/repo/kisilerdao_repository.dart';

class DetaysayfaCubit extends Cubit<void> {
  DetaysayfaCubit() : super(0);

  KisilerdaoRepository k1 = KisilerdaoRepository();

  Future<void> update(String kisi_id, String kisi_ad, String kisi_tel) async {
    await k1.update(kisi_id, kisi_ad, kisi_tel);
  }
}
