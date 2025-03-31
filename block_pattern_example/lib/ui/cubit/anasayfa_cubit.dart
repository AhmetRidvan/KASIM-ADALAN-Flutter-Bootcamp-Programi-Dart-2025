import 'package:block_pattern_example/data/repo/Matematik_Reporistory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnasayfaCubit extends Cubit<int> {
  AnasayfaCubit() : super(0);

  var mrepo = MatematikReporistory();
  //37:15
  void toplamaYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = sayi1 + sayi2;
    emit(sonuc); // tetikleme gönderme
  }

  void cikarmaYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = sayi1 - sayi2;
    emit(sonuc); // tetikleme gönderme
  }

  void carpmaYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = sayi1 * sayi2;
    emit(sonuc); // tetikleme gönderme
  }

  void bolmeYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = (sayi1 / sayi2).toInt();
    emit(sonuc); // tetikleme gönderme
  }
}
