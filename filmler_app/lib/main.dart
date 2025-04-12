import 'package:filmler_app/cubit/anasayfa_cubit.dart';
import 'package:filmler_app/ui/views/anasayfa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp()); //14:25
}

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
