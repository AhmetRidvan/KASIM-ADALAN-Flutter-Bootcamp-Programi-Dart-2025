import 'package:flutter/material.dart';
import 'package:pos_projesi/ui/login.dart';

class LoginSign extends StatefulWidget {
  const LoginSign({super.key});

  @override
  State<LoginSign> createState() => _LoginSignState();
}

class _LoginSignState extends State<LoginSign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            image('assets/shoping.jpg'),
            image('assets/heran.jpg'),
            Text(
              "Having trouble buying or selling products easly?\nLet us help you make it simpler!",
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Log In",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).colorScheme.primaryContainer,
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: Text("Sign In", textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget image(String text) {
  return Image.asset(text);
}
