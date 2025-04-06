import 'package:block_pattern_example/data/repo/Matematik_Reporistory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(0);

  var mrepo = MatematikReporistory();

  void toplamaYap(String alinanSayi1, String alinanSayi2) {
    emit(mrepo.toplamaYap(alinanSayi1, alinanSayi2)); // tetikleme gönderme
  }

  void cikarmaYap(String alinanSayi1, String alinanSayi2) {
    emit(mrepo.cikarmaYap(alinanSayi1, alinanSayi2)); // tetikleme gönderme
  }

  void carpmaYap(String alinanSayi1, String alinanSayi2) {
    emit(mrepo.carpmaYap(alinanSayi1, alinanSayi2));
  }

  void bolmeYap(String alinanSayi1, String alinanSayi2) {
    emit(mrepo.bolmeYap(alinanSayi1, alinanSayi2));
  }
}
