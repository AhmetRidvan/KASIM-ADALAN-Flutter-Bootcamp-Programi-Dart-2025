import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/basket_page_cubit.dart';

import 'package:graduation_project/cubit/detail_page_cubit.dart';
import 'package:graduation_project/cubit/main_page_cubit.dart';
import 'package:graduation_project/model/basket_item_model.dart';
import 'package:graduation_project/model/food_model.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
  int toplam = 0;
  @override
  void initState() {
    context.read<BasketPageCubit>().getBasketItems('realme');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BasketPageCubit, List<BasketItemModel>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          for (var x in state) {
            toplam =
                toplam +
                ((int.parse(x.yemek_fiyat)) +
                    (int.parse(x.yemek_siparis_adet)));
          }
          print(toplam);
          return Stack(
            children: [
              ListView.builder(
                itemCount: state.length,
                itemBuilder: (context, index) {
                  final items = state[index];

                  print(toplam);

                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: Image.network(
                            width: 100,
                            height: 100,
                            'http://kasimadalan.pe.hu/yemekler/resimler/${items.yemek_resim_adi}',
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {
                                  context.read<BasketPageCubit>().deleteItem(
                                    int.parse(items.sepet_yemek_id),
                                    items.kullanici_adi,
                                  );
                                },
                                icon: Icon(Icons.delete),
                              ),
                              Text(
                                "${(int.parse(items.yemek_fiyat) / int.parse(items.yemek_siparis_adet)).toInt()} ₺",
                              ),
                              Text(
                                items.yemek_adi,
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("${items.yemek_fiyat} ₺"),
                              Text("${items.yemek_siparis_adet} adet"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              Positioned(
                bottom: 40,
                right: 0,
                left: 0,
                child: Chip(
                  label: Text(
                    'Toplamları ${toplam.toString()}',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  color: WidgetStatePropertyAll(Colors.pinkAccent),
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.pinkAccent),
          );
        }
      },
    );
  }
}
