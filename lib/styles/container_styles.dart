import 'package:flutter/material.dart';

abstract class AppContainerStyle {
  static String selected1 = 'first';
  static BoxDecoration containerStyle = BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: selected1 == 'first'
        ? const Color.fromARGB(255, 83, 93, 102)
        : Colors.red,
  );
}
