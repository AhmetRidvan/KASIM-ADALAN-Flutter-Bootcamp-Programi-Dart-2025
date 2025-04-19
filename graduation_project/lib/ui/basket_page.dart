import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/basket_page_cubit.dart';

import 'package:graduation_project/cubit/detail_page_cubit.dart';
import 'package:graduation_project/model/basket_item_model.dart';
import 'package:graduation_project/model/food_model.dart';

class BasketPage extends StatefulWidget {
  const BasketPage({super.key});

  @override
  State<BasketPage> createState() => _BasketPageState();
}

class _BasketPageState extends State<BasketPage> {
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
          return ListView.builder(
            itemCount: state.length,
            itemBuilder: (context, index) {
              final items = state[index];
              return Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network(
                      width: 150,
                      'http://kasimadalan.pe.hu/yemekler/resimler/${items.yemek_resim_adi}',
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
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
                  ],
                ),
              );
            },
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
