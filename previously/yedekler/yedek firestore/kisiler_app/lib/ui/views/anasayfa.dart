import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/data/entity/kisiler.dart';
import 'package:kisiler_app/ui/views/cubits/anasayfa_cubit.dart';
import 'package:kisiler_app/ui/views/detay_sayfa.dart';
import 'package:kisiler_app/ui/views/kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({super.key});
  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  @override
  void initState() {
    context.read<AnasayfaCubit>().getPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            aramaYapiliyorMu
                ? TextField(
                  decoration: const InputDecoration(hintText: "Ara"),
                  onChanged: (aramSonucu) {
                    context.read<AnasayfaCubit>().ara(aramSonucu);
                  },
                )
                : const Text("Kişiler"),
        actions: [
          aramaYapiliyorMu
              ? IconButton(
                onPressed: () {
                  setState(() {
                    aramaYapiliyorMu = false;
                    context.read<AnasayfaCubit>().getPeople();
                  });
                },
                icon: const Icon(Icons.clear),
              )
              : IconButton(
                onPressed: () {
                  setState(() {
                    aramaYapiliyorMu = true;
                  });
                },
                icon: const Icon(Icons.search),
              ),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit, List<KisilerModel>>(
        builder: (context, kisilerListesi) {
          if (kisilerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisilerListesi.length, //3
              itemBuilder: (context, indeks) {
                //0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetaySayfa(kisi: kisi),
                      ),
                    );
                  },
                  child: Card(
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  kisi.kisi_ad,
                                  style: const TextStyle(fontSize: 20),
                                ),
                                Text(kisi.kisi_tel),
                              ],
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${kisi.kisi_ad} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      context.read<AnasayfaCubit>().delete(
                                        kisi.kisi_id,
                                      );
                                    },
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const KayitSayfa()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
