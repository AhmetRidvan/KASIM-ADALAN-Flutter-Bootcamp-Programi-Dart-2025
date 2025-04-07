import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginSignState();
}

class _LoginSignState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  bool _isRememberMeChecked = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  image('assets/pass.png'),
                  Text(
                    "Log In",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.mail),
                      labelText: 'Enter your email',

                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !value.contains('@')) {
                        return 'There are some problems';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Enter password',
                      border: const OutlineInputBorder(),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _isRememberMeChecked,
                            onChanged: (value) {
                              setState(() {
                                _isRememberMeChecked = value!;
                              });
                            },
                          ),
                          const Text(
                            "Remember Me",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forget password?",
                          style: TextStyle(
                            color:
                                Theme.of(context).colorScheme.primaryFixedDim,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                    ),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor:
                                Theme.of(context).colorScheme.error,
                            content: Text(
                              'Switching to the main screen.',
                              style: TextStyle(),
                            ),
                          ),
                        );
                      }
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
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          "OR Login With",
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                      const Expanded(
                        child: Divider(thickness: 1, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Account(
                        "Facebook",
                        Icon(Icons.facebook, color: Colors.blue),
                      ),
                      Account(
                        "Google",
                        Icon(Icons.g_mobiledata, color: Colors.red),
                      ),
                      Account("Apple", Icon(Icons.apple, color: Colors.black)),
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont'have an account?",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),

                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Sign up",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  GestureDetector Account(String what, Icon icon) {
    return GestureDetector(
      onTap: () {
        print("$what Login");
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(8),
        ),
        child: icon,
      ),
    );
  }
}

Widget image(String text) {
  return Image.asset(text);
}
