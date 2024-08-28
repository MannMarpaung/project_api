import 'package:flutter/material.dart';
import 'package:project_api/ui/main_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final email = TextEditingController();
  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final password = TextEditingController();
  var isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/jett.jpg',
              fit: BoxFit.cover,
              width: 100.0,
            ),
            Text(
              'Register to create an account',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                ),
                style: TextStyle(
                  fontFamily: 'Jost',
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: firstName,
                      decoration: InputDecoration(
                        labelText: 'First Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Jost',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: lastName,
                      decoration: InputDecoration(
                        labelText: 'Last Name',
                        labelStyle: TextStyle(
                          fontFamily: 'Jost',
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            25.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: password,
                autocorrect: false,
                enableSuggestions: false,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    fontFamily: 'Jost',
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      25.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 247, 247, 247),
                      ),
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(
                          () {
                            if (email.text.isEmpty ||
                                firstName.text.isEmpty ||
                                lastName.text.isEmpty ||
                                password.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Please fill all field',
                                  ),
                                ),
                              );
                            } else if (!email.text.contains('@')) {
                              isSignedIn = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Email is not valid',
                                  ),
                                ),
                              );
                            } else if (password.text.length < 8) {
                              isSignedIn = false;
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Password must be at least 8 character',
                                  ),
                                ),
                              );
                            } else {
                              isSignedIn = true;
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(
                                    username: email.text,
                                    password: password.text,
                                    firstName: firstName.text,
                                    lastName: lastName.text,
                                  ),
                                ),
                                (route) => false,
                              );
                            }
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 157, 209, 236),
                      ),
                      child: Text(
                        'Register',
                        style: TextStyle(
                          fontFamily: 'Jost',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
// 3