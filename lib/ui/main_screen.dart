import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 100.0,
            ),
            Text(
              'Username',
              style: TextStyle(
                fontFamily: 'Jost',
                fontSize: 18.0,
                letterSpacing: 2.0,
              ),
            ),
            Text(
              'Password',
              style: TextStyle(
                  fontFamily: 'Jost', fontSize: 18.0, letterSpacing: 2.0),
            ),
          ],
        ),
      ),
    );
  }
}
