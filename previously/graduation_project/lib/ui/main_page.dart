import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/favorites_page_cubit.dart';
import 'package:graduation_project/cubit/main_page_cubit.dart';
import 'package:graduation_project/model/food_model.dart';
import 'package:graduation_project/ui/detail_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  TextEditingController t1 = TextEditingController();
  String text = '';
  @override
  void initState() {
    context.read<MainPageCubit>().getFoods();
    super.initState();
  }

  void changeText(String text1) {
    setState(() {
      text = text1.toLowerCase();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.pinkAccent,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: TextField(
            onChanged: changeText,
            controller: t1,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(33),
                borderSide: BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(33),
                borderSide: BorderSide(color: Colors.white),
              ),

              labelText: "Search",
              labelStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      body: BlocBuilder<MainPageCubit, List<FoodModel>>(
        builder: (context, state) {
          if (state.isNotEmpty) {
            final filteredList =
                state.where((element) {
                  return element.yemek_adi.toLowerCase().contains(text);
                }).toList();
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemCount: filteredList.length,
              itemBuilder: (context, index) {
                final items = filteredList[index];
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
                                onPressed: () {
                                  context
                                      .read<FavoritesPageCubit>()
                                      .addFavorite(items);
                                },
                                icon: Icon(Icons.favorite, color: Colors.blue),
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
      ),
    );
  }
}
