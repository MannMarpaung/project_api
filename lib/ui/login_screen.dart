import 'package:flutter/material.dart';
import 'package:project_api/ui/main_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? username;
  String? password;

  @override
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  var isSignedIn = false;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/jett.jpg',
              width: 100,
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Login to your account',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 24.0,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  labelStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        // kondisi bila username null
                        if (usernameController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Username Cannot be empty',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                ),
                              ),
                            ),
                          );
                        } else {
                          isSignedIn = true;
                        }

                        if (passwordController.text.isEmpty) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Password Cannot be empty',
                                style: TextStyle(
                                  fontFamily: 'Jost',
                                ),
                              ),
                            ),
                          );
                        } else {
                          isSignedIn = true;
                        }

                        if (usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty) {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(
                                username: usernameController.text,
                                password: passwordController.text,
                              ),
                            ),
                            (route) => false,
                          );
                        }
                      },
                    );
                  },
                  style: ButtonStyle(
                    elevation: WidgetStateProperty.all(5.0),
                    backgroundColor: WidgetStateProperty.all(
                      Color.fromARGB(255, 157, 209, 236),
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontFamily: 'Jost',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              style: ButtonStyle(
                elevation: WidgetStatePropertyAll(
                  5.0,
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Color.fromARGB(255, 247, 247, 247),
                ),
              ),
              child: Text(
                'Register',
                style: TextStyle(
                  fontFamily: 'Jost',
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
