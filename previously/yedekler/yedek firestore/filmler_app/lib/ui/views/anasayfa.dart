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
                print(filmler.resim);
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
                        Image.network(
                          'http://kasimadalan.pe.hu/filmler_yeni/resimler/${filmler.resim}',
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
