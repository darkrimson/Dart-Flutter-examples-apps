import 'package:flutter/material.dart';

import 'constants.dart';
import 'main_page/main_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calorie Calculator',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.blueDark,
        appBarTheme: const AppBarTheme(backgroundColor: AppColors.blueDark),
      ),
      home: const MainPage(),
    );
  }
}
