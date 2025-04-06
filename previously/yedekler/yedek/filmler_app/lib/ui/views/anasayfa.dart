import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() {
    return _anaSayfa();
  }
}

class _anaSayfa extends State<Anasayfa> {
  Future<List<Filmmodel>> filmleriYukle() async {
    List<Filmmodel> filmlerListesi = <Filmmodel>[];
    var f1 = Filmmodel(id: 1, ad: "Django", resim: "django.png", fiyat: 24);
    var f2 = Filmmodel(
      id: 2,
      ad: "Interstellar",
      resim: "interstellar.png",
      fiyat: 32,
    );
    var f3 = Filmmodel(
      id: 3,
      ad: "Inception",
      resim: "inception.png",
      fiyat: 16,
    );
    var f4 = Filmmodel(
      id: 4,
      ad: "The Hateful Eight",
      resim: "thehatefuleight.png",
      fiyat: 28,
    );
    var f5 = Filmmodel(
      id: 5,
      ad: "The Pianist",
      resim: "thepianist.png",
      fiyat: 18,
    );
    var f6 = Filmmodel(
      id: 6,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filmler')),
      body: FutureBuilder(
        future: filmleriYukle(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print('hi');
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2, //yatay 1 ise dikey 2 olsun
              ),
              itemBuilder: (context, index) {
                var filmler = filmlerListesi[index];
                return Card(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return DetaySayfa(f1: filmler);
                          },
                        ),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          'images/${filmler.resim}',
                          fit: BoxFit.cover,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${filmler.fiyat} ₺',
                              style: TextStyle(fontSize: 24),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                print('${filmler.ad} sepete eklendi');
                              },
                              child: Text('Sepet'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: filmlerListesi!.length,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
          ;
        },
      ),
    );
  }
}
