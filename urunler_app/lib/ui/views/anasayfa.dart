import 'package:flutter/material.dart';
import 'package:urunler_app/data/entity/urunler.dart';

class Anasayfa extends StatefulWidget {
  Anasayfa({super.key});

  @override
  State<Anasayfa> createState() {
    return _Anasayfa();
  }
}

class _Anasayfa extends State<Anasayfa> {
  Future<List<UrunModel>> urunleriYukle() async {
    var urunlerListesi = <UrunModel>[];
    var u1 = UrunModel(
      id: 1,
      ad: "Macbook Pro 14",
      resim: "bilgisayar.png",
      fiyat: 43000,
    );
    var u2 = UrunModel(
      id: 2,
      ad: "Rayban Club Master",
      resim: "gozluk.png",
      fiyat: 2500,
    );
    var u3 = UrunModel(
      id: 3,
      ad: "Sony ZX Series",
      resim: "kulaklik.png",
      fiyat: 40000,
    );
    var u4 = UrunModel(
      id: 4,
      ad: "Gio Armani",
      resim: "parfum.png",
      fiyat: 2000,
    );
    var u5 = UrunModel(
      id: 5,
      ad: "Casio X Series",
      resim: "saat.png",
      fiyat: 8000,
    );
    var u6 = UrunModel(
      id: 6,
      ad: "Dyson V8",
      resim: "supurge.png",
      fiyat: 18000,
    );
    var u7 = UrunModel(
      id: 7,
      ad: "IPhone 13",
      resim: "telefon.png",
      fiyat: 32000,
    );
    urunlerListesi.add(u1);
    urunlerListesi.add(u2);
    urunlerListesi.add(u3);
    urunlerListesi.add(u4);
    urunlerListesi.add(u5);
    urunlerListesi.add(u6);
    urunlerListesi.add(u7);

    return urunlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ürünler')),
      body: FutureBuilder(
        future: urunleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.data == null || snapshot.data!.isEmpty) {
            return Center(child: Text("Nothing here"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            var urunlerListesi = snapshot.data;
            return ListView.builder(
              itemCount: urunlerListesi!.length,
              itemBuilder: (context, index) {
                var urun = urunlerListesi[index];
                return Card(
                  margin: EdgeInsets.only(top: 0, bottom: 5),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(33),
                          child: Image.asset(
                            height: 130,
                            width: 130,
                            'images/${urun.resim}',
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(urun.ad),
                          SizedBox(height: 10),
                          Text(
                            '${urun.fiyat} ₺',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              print('${urun.ad} eklendi');
                            },
                            child: Text('Sepete ekle'),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
