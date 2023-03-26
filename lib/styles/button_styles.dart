import 'package:flutter/material.dart';

abstract class AppButtonStyle {
  static const resultButtonStyle = ButtonStyle(
    backgroundColor: MaterialStatePropertyAll(Colors.red),
    shadowColor: MaterialStatePropertyAll(Colors.blueGrey),
    elevation: MaterialStatePropertyAll(8),
    minimumSize: MaterialStatePropertyAll(
      Size(double.infinity, 84),
    ),
  );
}
