class MatematikReporistory {
  int toplamaYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = sayi1 + sayi2;
    return sonuc;
  }

  int cikarmaYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = sayi1 - sayi2;
    return sonuc;
  }

  int carpmaYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = sayi1 * sayi2;
    return sonuc;
  }

  int bolmeYap(String alinanSayi1, String alinanSayi2) {
    int sayi1 = int.parse(alinanSayi1);
    int sayi2 = int.parse(alinanSayi2);
    int sonuc = (sayi1 / sayi2).toInt();
    return sonuc;
  }
}
