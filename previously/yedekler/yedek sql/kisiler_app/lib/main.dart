import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/ui/views/anasayfa.dart';
import 'package:kisiler_app/ui/views/cubits/anasayfa_cubit.dart';
import 'package:kisiler_app/ui/views/cubits/detaysayfa_cubit.dart';
import 'package:kisiler_app/ui/views/cubits/kayitsayfa_cubit.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget { // 33:09
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return KayitsayfaCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return DetaysayfaCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return AnasayfaCubit();
          },
        ),
      ],
      child: MaterialApp(home: Anasayfa()),
    );
  }
}
