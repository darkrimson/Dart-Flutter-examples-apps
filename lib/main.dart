import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generate.dart';
import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Generate>(
      create: (context) => Generate(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'PressStart',
            colorScheme: const ColorScheme.dark(),
            scaffoldBackgroundColor: Colors.grey.shade900),
        initialRoute: '/',
        routes: {'/': (context) => const HomePage()},
      ),
    );
  }
}
