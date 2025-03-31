import 'package:block_pattern_example/ui/cubit/anasayfa_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});

  @override
  State<Anasayfa> createState() {
    return _Anasayfa();
  }
}

class _Anasayfa extends State<Anasayfa> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Block Pattern",
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BlocBuilder<AnasayfaCubit, int>(
                builder: (context, state) {
                  return Text(
                    'Sonuç = $state',
                    style: TextStyle(fontSize: 50),
                  ); // dinleme
                },
              ),

              TextField(
                decoration: InputDecoration(hintText: 'Sayı 1'),
                controller: t1,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Sayı 2'),
                controller: t2,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        context.read<AnasayfaCubit>().toplamaYap(
                          t1.text,
                          t2.text,
                        );
                      },
                      child: Text('Toplama'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AnasayfaCubit>().cikarmaYap(
                          t1.text,
                          t2.text,
                        );
                      },
                      child: Text('Çıkarma'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AnasayfaCubit>().carpmaYap(
                          t1.text,
                          t2.text,
                        );
                      },
                      child: Text('Çarpma'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        context.read<AnasayfaCubit>().bolmeYap(
                          t1.text,
                          t2.text,
                        );
                      },
                      child: Text('Bölme'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
