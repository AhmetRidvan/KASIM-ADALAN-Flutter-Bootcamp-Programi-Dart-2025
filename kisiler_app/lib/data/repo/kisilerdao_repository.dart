import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/sqlite/veritaban%C4%B1_yardimcisi.dart';

class KisilerdaoRepository {
  Future<void> save(String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniKisi = <String, dynamic>{};
    yeniKisi['kisi_ad'] = kisi_ad;
    yeniKisi['kisi_tel'] = kisi_tel;
    db.insert('kisiler', yeniKisi);
  }

  Future<void> update(int kisi_id, String kisi_ad, String kisi_tel) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenKisi = <String, dynamic>{};
    guncellenenKisi['kisi_ad'] = kisi_ad;
    guncellenenKisi['kisi_tel'] = kisi_tel;
    guncellenenKisi['kisi_id'] = kisi_id;
    db.update(
      'kisiler',
      guncellenenKisi,
      where: 'kisi_id = ?',
      whereArgs: [kisi_id],
    );
  }

  Future<List<Kisiler>> getPeople() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery(
      'SELECT * FROM kisiler',
    );

    return List.generate(maps.length, (index) {
      // liste üretiyor
      var satir = maps[index];

      return Kisiler(
        // database'deki field'ler her zaman key'dir ve String dir. fakat değerleri dynamictir.
        kisiId: satir['kisi_id'],
        kisiAd: satir['kisi_ad'],
        kisiTel: satir['kisi_tel'],
      );
    });
  }

  Future<void> delete(int kisi_id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete('kisiler', where: 'kisi_id = ?', whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> call(String name) async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisiId: 1, kisiAd: 'Zeynep', kisiTel: '05416288099');

    kisilerListesi.add(k1);
    return kisilerListesi;
  }
}
