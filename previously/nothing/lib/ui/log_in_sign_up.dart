import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/ui/control_of_page.dart';

class LogInSignUpPage extends StatefulWidget {
  const LogInSignUpPage({super.key});

  @override
  State<LogInSignUpPage> createState() => _LogInSignUpPageState();
}

class _LogInSignUpPageState extends State<LogInSignUpPage> {
  final firebase = FirebaseAuth.instance;

  GlobalKey<FormState> key = GlobalKey();
  TextEditingController t1 = TextEditingController();
  TextEditingController t2 = TextEditingController();
  bool b1 = false;
  late final credantial;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: key,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: t1,
                  decoration: InputDecoration(
                    labelText: "Name & Surname",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty ||
                        value.length < 4 ||
                        !value.contains('@')) {
                      return "Geçersiz giriş";
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 20),
              SizedBox(
                width: 300,
                child: TextFormField(
                  controller: t2,
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return "Geçersiz parola";
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 20),
              b1
                  ? ElevatedButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        try {
                          credantial = await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                email: t1.text,
                                password: t2.text,
                              );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return ControlOfPage();
                              },
                            ),
                            (route) {
                              return false;
                            },
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "email-already-in-use") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "The account already exists for that email.",
                                ),
                              ),
                            );
                          } else if (e.code == "weak-password") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Week password.")),
                            );
                          }
                        }
                      }
                    },
                    child: Text("Kayıt ol"),
                  )
                  : ElevatedButton(
                    onPressed: () async {
                      if (key.currentState!.validate()) {
                        try {
                          credantial = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                                email: t1.text,
                                password: t2.text,
                              );
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) {
                                return ControlOfPage();
                              },
                            ),
                            (route) {
                              return false;
                            },
                          );
                        } on FirebaseAuthException catch (e) {
                          if (e.code == "user-not-found") {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text("Böyle bir kullanıcı yok"),
                              ),
                            );
                          }
                        }
                      }
                    },
                    child: Text("Giriş yap"),
                  ),
              if (Platform.isAndroid)
                InkWell(
                  child: Image.asset('assets/google.png', width: 50),
                  onTap: () {
                    print("Selam");
                  },
                ),
              IconButton(
                onPressed: () {
                  setState(() {
                    b1 = !b1;
                    t1.clear();
                    t2.clear();
                  });
                },
                icon: Icon(Icons.change_circle_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
