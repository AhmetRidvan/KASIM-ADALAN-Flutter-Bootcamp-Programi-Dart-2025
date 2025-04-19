import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/detail_page_cubit.dart';
import 'package:graduation_project/model/food_model.dart';

class DetailPage extends StatefulWidget {
  DetailPage({super.key, required this.f1});

  FoodModel f1;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int adet = 1;
  int toplam = 0;
  @override
  void initState() {
    toplam = int.parse(widget.f1.yemek_fiyat);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "${toplam.toString()} ₺",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
              onPressed: () async {
                await context
                    .read<DetailPageCubit>()
                    .addBasket(
                      widget.f1.yemek_adi,
                      widget.f1.yemek_resim_adi,
                      int.parse(widget.f1.yemek_fiyat),
                      adet,
                      "realme",
                    )
                    .then((value) {
                      Navigator.of(context).pop();
                    });
              },
              child: Text("Sepete ekle", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.favorite_border_outlined),
          ),
        ],
        title: Text(widget.f1.yemek_adi),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              fit: BoxFit.cover,
              "http://kasimadalan.pe.hu/yemekler/resimler/${widget.f1.yemek_resim_adi}",
            ),
            Text(
              " ${widget.f1.yemek_fiyat} ₺",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              widget.f1.yemek_adi,
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    if (adet > 1) {
                      setState(() {
                        adet--;
                        final x = int.parse(widget.f1.yemek_fiyat);
                        toplam = toplam - x;
                      });
                    }
                  },
                  icon: Icon(
                    Icons.remove_circle,
                    size: 50,
                    color: Colors.purple,
                  ),
                ),
                Text(
                  adet.toString(),
                  style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      adet++;
                      final x = int.parse(widget.f1.yemek_fiyat);
                      toplam = toplam + x;
                    });
                  },
                  icon: Icon(
                    Icons.add_box_rounded,
                    size: 50,
                    color: Colors.purple,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
/*
Future<void> save(String kisi_ad, String kisi_tel) async {
    var url = 'http://kasimadalan.pe.hu/kisiler/insert_kisiler.php';
    var map = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await Dio().post(url, data: FormData.fromMap(map));
    print(cevap.toString());
  }

*/