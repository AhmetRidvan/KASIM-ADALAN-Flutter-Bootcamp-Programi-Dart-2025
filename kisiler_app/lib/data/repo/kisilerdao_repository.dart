import 'package:kisiler_app/data/entity/kisiler.dart';

class KisilerdaoRepository {
  Future<void> save(String kisi_ad,String kisi_tel) async {
    print("Kişi Kaydet : $kisi_ad - $kisi_tel");
  }
  Future<void> update(int kisi_id,String kisi_ad,String kisi_tel) async {
    print("Kişi Güncelle : $kisi_id - $kisi_ad - $kisi_tel");
  }

   Future<List<Kisiler>> getPeople() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisiId: 1, kisiAd: 'Zeynep', kisiTel: '05416288099');
    var k2 = Kisiler(kisiId: 2, kisiAd: 'Aleyna', kisiTel: '0547895756');
    var k3 = Kisiler(kisiId: 3, kisiAd: 'Mahmut', kisiTel: '0985695756');
    kisilerListesi.add(k1);
    
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }
}
