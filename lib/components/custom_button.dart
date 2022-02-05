// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  CustomButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.07,
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.red,
              offset: Offset(0.0, 1.0), //(x,y)
              blurRadius: 6.0,
            ),
          ],
          color: Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(30)),
      child: TextButton(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 30),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
