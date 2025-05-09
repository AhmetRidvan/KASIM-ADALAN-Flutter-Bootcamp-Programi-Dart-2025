import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/favorites_page_cubit.dart';
import 'package:graduation_project/model/food_model.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoritesPageCubit, List<FoodModel>>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state.length,
          itemBuilder: (context, index) {
            final x = state[index];
            return Card(
              margin: EdgeInsets.all(5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Image.network(
                        height: 150,

                        fit: BoxFit.cover,
                        "http://kasimadalan.pe.hu/yemekler/resimler/${x.yemek_resim_adi}",
                      ),
                    ],
                  ),
                  Text(
                    x.yemek_adi,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${x.yemek_fiyat} ₺",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Image.asset('assets/free.png', width: 30),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.add_box_rounded),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
