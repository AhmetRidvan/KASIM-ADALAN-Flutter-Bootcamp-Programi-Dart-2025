import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/cubits/mainPage_cubit.dart';
import 'package:to_do/cubits/registerPage_cubit.dart';
import 'package:to_do/cubits/upgradePage_cubit.dart';
import 'package:to_do/ui/mainPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return MainPageCubit();
          },
        ),BlocProvider(
          create: (context) {
            return RegisterPageCubit();
          },
        ),BlocProvider(
          create: (context) {
            return UpgradePageCubit();
          },
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Mainpage(),),
    );
  }
}
