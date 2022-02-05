// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final Function(String?) onChanged;
  final inputAction;
  final TextInputType keyboardType;
  var obscure;
  CustomTextField({
    required this.hintText,
    required this.onChanged,
    required this.inputAction,
    required this.keyboardType,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      height: MediaQuery.of(context).size.height * 0.1,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.orange[100],
      ),
      child: TextField(
        obscureText: obscure,
        onChanged: onChanged,
        textInputAction: inputAction,
        keyboardType: keyboardType,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(fontSize: 20, color: Colors.pink)),
      ),
    );
  }
}
