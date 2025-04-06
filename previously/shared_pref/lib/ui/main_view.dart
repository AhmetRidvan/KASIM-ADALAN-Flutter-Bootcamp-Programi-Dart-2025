import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() {
    return _mainView();
  }
}

class _mainView extends State<MainView> {
  int sayi = 0;

  @override
  void initState() {
    sayac();
    super.initState();
  }
 
  Future<void> sayac() async {
    var sp = await SharedPreferences.getInstance();
    sayi = sp.getInt('sayac') ?? 0;
    setState(() {
      sayi++;
    });
    sp.setInt('sayac', sayi);
  }

  Future<void> test() async {
    var sp = await SharedPreferences.getInstance();
    sp.setString('isim', 'Zeynep');
    sp.setInt('no', 23);
    sp.setDouble('kilo', 120.3);
    sp.setBool('evli', false);

    final listem = <String>[];
    listem.add('evet');
    listem.add('merhaba');
    listem.add('bence');
    listem.add('duramam');
    listem.add('eller havaya');
    sp.setStringList('liste', listem);

    print(sp.getInt('no') ?? 0);
    print(sp.getDouble('kilo') ?? 0.0);
    print(sp.getBool('evli') == false);
    print(sp.getString('isim'));

    var gelenListe = sp.getStringList('liste') ?? <String>[];
    if (gelenListe.isNotEmpty) {
      for (var x in gelenListe) {
        print('for $x');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shared Preferences')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text('Sayı $sayi', style: TextStyle(fontSize: 50))],
        ),
      ),
    );
  }
}
