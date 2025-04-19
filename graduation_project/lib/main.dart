import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:graduation_project/control_of_page.dart';
import 'package:graduation_project/cubit/basket_page_cubit.dart';

import 'package:graduation_project/cubit/detail_page_cubit.dart';
import 'package:graduation_project/cubit/main_page_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

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
        ),
        BlocProvider(
          create: (context) {
            return DetailPageCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return BasketPageCubit();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ControlOfPage(),
      ),
    );
  }
}
// 11:56
// http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php   use get filmler uygulamasına bakabilirsin

//http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php post ile Kisiler uygulamasındaki insert ile yapabilirsiniz

//http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php post ile çalışıyor kullanici adı istiyor sadece kisiler uygulamasındaki arama işlemi 

//http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php post

//http://kasimadalan.pe.hu/yemekler/resimler/ayran.png 

//ekstra özellikler ekleyebilirsiniz

//Kasım hocayı etiketle 