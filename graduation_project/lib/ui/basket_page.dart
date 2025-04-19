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
              return Card(child: Text(state[0].kullanici_adi));
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
