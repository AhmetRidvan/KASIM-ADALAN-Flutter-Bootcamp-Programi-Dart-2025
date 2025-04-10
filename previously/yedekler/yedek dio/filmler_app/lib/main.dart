import 'package:filmler_app/cubit/anasayfa_cubit.dart';
import 'package:filmler_app/ui/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AnasayfaCubit();
          },
        ),
      ],
      child: MaterialApp(debugShowCheckedModeBanner: false, home: Anasayfa()),
    );
  }
}
