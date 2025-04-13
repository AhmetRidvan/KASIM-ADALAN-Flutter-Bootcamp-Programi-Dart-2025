import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do/cubits/registerPage_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _UpgradepageState();
}

class _UpgradepageState extends State<RegisterPage> {
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
                context.read<RegisterPageCubit>().save(t1.text, t2.text);
              },
              child: Text("Kaydol"),
            ),
          ],
        ),
      ),
    );
  }
}
