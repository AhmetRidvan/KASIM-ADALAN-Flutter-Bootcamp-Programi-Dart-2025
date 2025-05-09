import 'package:sqlite_foreignkey/kategoriler.dart';
import 'package:sqlite_foreignkey/yonetmenler.dart';

class Filmler {
  int film_id;
  String film_ad;
  int film_yil;
  String film_resim;
  Kategoriler kategoriler;
  Yonetmenler yonetmenler;

  Filmler({required this.film_id,required this.film_ad,required this.film_yil,required this.film_resim,required this.kategoriler,required this.yonetmenler});
} 

// SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id and filmler.yonetmen_id = yonetmenler.yonetmen_id; foreignkey için