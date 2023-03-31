import 'dart:math';

import 'package:flutter/material.dart';

class Generate extends ChangeNotifier {
  List<Widget> data = [];
  final length = 2;
  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  final Random _rnd = Random();

  Future<void> generate() async {
    while (true) {
      await Future<void>.delayed(const Duration(milliseconds: 10));
      List<String> genText = List.generate(
          7,
          (index) => String.fromCharCodes(Iterable.generate(
              length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)))));

      if (data.length >= 100) {
        data = data.sublist(0, 45);
      }

      data.insert(
          0,
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(genText[0],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[1],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[2],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[3],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[4],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[5],
                      style: green, overflow: TextOverflow.ellipsis),
                  Text(genText[6],
                      style: green, overflow: TextOverflow.ellipsis),
                ]),
          ));
      notifyListeners();
    }
  }
}

const TextStyle green = TextStyle(color: Colors.green, shadows: [
  Shadow(color: Colors.green, blurRadius: 5, offset: Offset(2, 2))
]);
