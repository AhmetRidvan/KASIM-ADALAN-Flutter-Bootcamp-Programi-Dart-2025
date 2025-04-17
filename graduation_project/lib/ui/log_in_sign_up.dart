import 'package:flutter/material.dart';

class LogInSignUpPage extends StatefulWidget {
  const LogInSignUpPage({super.key});

  @override
  State<LogInSignUpPage> createState() => _LogInSignUpPageState();
}

class _LogInSignUpPageState extends State<LogInSignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Name",

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
