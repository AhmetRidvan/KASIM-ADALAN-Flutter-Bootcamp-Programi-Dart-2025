
import 'package:flutter/material.dart';
import 'package:graduation_project/ui/control_of_page.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ControlOfPage(),
    );
  }
}

// http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php   use get filmler uygulamasına bakabilirsin

//http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php post ile Kisiler uygulamasındaki insert ile yapabilirsiniz

//http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php post ile çalışıyor kullanici adı istiyor sadece kisiler uygulamasındaki arama işlemi 

//http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php post

//http://kasimadalan.pe.hu/yemekler/resimler/ayran.png 

//ekstra özellikler ekleyebilirsiniz

//Kasım hocayı etiketle