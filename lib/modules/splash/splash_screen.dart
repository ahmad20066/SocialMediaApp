// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.red,
          Colors.pink,
          Colors.blue,
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
      ),
      child: Center(
        child: Image(
          image: AssetImage('images/logo-ig-png-32473.png'),
          height: MediaQuery.of(context).size.height * 0.3,
        ),
      ),
    );
  }
}
