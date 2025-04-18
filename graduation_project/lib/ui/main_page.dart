import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/cubit/main_page_cubit.dart';

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
    return Center(child: Text("Main page"));
  }
}
