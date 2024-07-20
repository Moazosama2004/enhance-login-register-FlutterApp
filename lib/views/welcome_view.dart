import 'package:flutter/material.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  static final String id = 'WelcomeView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome ya 5alllllllllllllllo',
          style: TextStyle(
            fontSize: 25
          ),
        ),
      ),
    );
  }
}
