import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:filmler_app/cubit/anasayfa_cubit.dart';
import 'package:filmler_app/data/entity/filmModel.dart';
import 'package:filmler_app/ui/views/detay_sayfa.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() {
    return _anaSayfa();
  }
}

class _anaSayfa extends State<Anasayfa> {
  @override
  void initState() {
    context.read<AnasayfaCubit>().filmleriYukle();
    var collection = FirebaseFirestore.instance.collection("Filmler");
    var v1 = {'id': '', 'ad': 'Django', 'resim': 'django.png', 'fiyat': 24};
    var v2 = {
      'id': '',
      'ad': 'Insterstellar',
      'resim': 'insterstellar.png',
      'fiyat': 32,
    };
    var v3 = {
      'id': '',
      'ad': 'Inception',
      'resim': 'inception.png',
      'fiyat': 16,
    };
    var v4 = {
      'id': '',
      'ad': 'The Hateful Eight',
      'resim': 'thehatefuleight.png',
      'fiyat': 28,
    };
    var v5 = {
      'id': '',
      'ad': 'The Pianist',
      'resim': 'thepianist.png',
      'fiyat': 18,
    };
    var v6 = {
      'id': '',
      'ad': 'Anadoluda',
      'resim': 'anadoluda.png',
      'fiyat': 10,
    };

    collection.add(v1);
    collection.add(v2);
    collection.add(v3);
    collection.add(v4);
    collection.add(v5);
    collection.add(v6);


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Filmler')),
      body: BlocBuilder<AnasayfaCubit, List<Filmmodel>>(
        builder: (context, snapshot) {
          if (snapshot.isNotEmpty) {
            print('hi');
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2, //yatay 1 ise dikey 2 olsun
              ),
              itemBuilder: (context, index) {
                var filmler = snapshot[index];
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
                      context.read<AnasayfaCubit>().filmleriYukle();
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
              itemCount: snapshot!.length,
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
