// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CustomCheckBox extends StatelessWidget {
  bool value;
  var onChanged;
  CustomCheckBox({
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          checkColor: Colors.black,
          activeColor: Colors.yellow,
        ),
        Text("Keep me Signed In"),
      ],
    );
  }
}
