import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/cubits/registerPage_cubit.dart';
import 'package:to_do/cubits/upgradePage_cubit.dart';

class Upgradepage extends StatefulWidget {
  Upgradepage({
    super.key,
    required this.id,
    required this.text,
    required this.title,
  });
  String title;
  String text;
  int id;

  @override
  State<Upgradepage> createState() => _UpgradepageState();
}

class _UpgradepageState extends State<Upgradepage> {
  @override
  void initState() {
    super.initState();
    t1.text = widget.title;
    t2.text = widget.text;
  }

  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: t1,
                decoration: InputDecoration(labelText: 'Title ?'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: TextField(
                controller: t2,
                decoration: InputDecoration(labelText: 'Text ?'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<UpgradePageCubit>().upgrade(
                  widget.id,
                  t1.text,
                  t2.text,
                );
                print('güncellendi');
              },
              child: Text("Güncelle"),
            ),
          ],
        ),
      ),
    );
  }
}
