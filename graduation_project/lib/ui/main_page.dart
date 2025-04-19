import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/main_page_cubit.dart';
import 'package:graduation_project/model/food_model.dart';
import 'package:graduation_project/ui/detail_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<MainPageCubit>().getFoods();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainPageCubit, List<FoodModel>>(
      builder: (context, state) {
        if (state.isNotEmpty) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.7,
            ),
            itemCount: state.length,
            itemBuilder: (context, index) {
              final items = state[index];
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return DetailPage(f1: items);
                      },
                    ),
                  );
                },
                child: Card(
                  margin: EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          Image.network(
                            height: 150,

                            fit: BoxFit.cover,
                            "http://kasimadalan.pe.hu/yemekler/resimler/${items.yemek_resim_adi}",
                          ),
                          Positioned(
                            right: 0,

                            child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.favorite_border_outlined),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        items.yemek_adi,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${items.yemek_fiyat} ₺",
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
