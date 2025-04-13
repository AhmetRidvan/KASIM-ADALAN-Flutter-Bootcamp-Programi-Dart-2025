import 'package:filmler_app/data/entity/filmModel.dart';

class FilmlerdaoRepository {
  Future<List<Filmmodel>> filmleriYukle() async {
    List<Filmmodel> filmlerListesi = <Filmmodel>[];
    var f1 = Filmmodel(id: "1", ad: "Django", resim: "django.png", fiyat: 24);
    var f2 = Filmmodel(
      id: "2",
      ad: "Interstellar",
      resim: "interstellar.png",
      fiyat: 32,
    );
    var f3 = Filmmodel(
      id: "3",
      ad: "Inception",
      resim: "inception.png",
      fiyat: 16,
    );
    var f4 = Filmmodel(
      id: "4",
      ad: "The Hateful Eight",
      resim: "thehatefuleight.png",
      fiyat: 28,
    );
    var f5 = Filmmodel(
      id: "5",
      ad: "The Pianist",
      resim: "thepianist.png",
      fiyat: 18,
    );
    var f6 = Filmmodel(
      id: "6",
      ad: "Anadoluda",
      resim: "anadoluda.png",
      fiyat: 10,
    );
    filmlerListesi.add(f1);
    filmlerListesi.add(f2);
    filmlerListesi.add(f3);
    filmlerListesi.add(f4);
    filmlerListesi.add(f5);
    filmlerListesi.add(f6);
    return filmlerListesi;
  }
}
