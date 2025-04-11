import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_app/ui/views/anasayfa.dart';
import 'package:kisiler_app/ui/views/cubits/anasayfa_cubit.dart';
import 'package:kisiler_app/ui/views/cubits/detaysayfa_cubit.dart';
import 'package:kisiler_app/ui/views/cubits/kayitsayfa_cubit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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
