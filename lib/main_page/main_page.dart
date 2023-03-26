import 'package:flutter/material.dart';

import '../styles/button_styles.dart';
import '../styles/container_styles.dart';
import '../styles/text_button_styles.dart';
import '../styles/text_styles.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  double _slider = 150;
  int weight = 50;
  int age = 18;
  String selectedMan = 'check';
  String selectedWoman = 'check';
  double result = 0;

  void ageCounterPlus() {
    setState(() {
      age++;
    });
  }

  void ageCounterMinus() {
    setState(() {
      if (age != 0) {
        age--;
      }
    });
  }

  void weightCounterPlus() {
    setState(() {
      weight++;
    });
  }

  void weightCounterMinus() {
    setState(() {
      if (weight != 0) {
        weight--;
      }
    });
  }

  int resultCalculate() {
// для мужчин: (10 х вес) + (6,25 х рост) – (5 х возраст) + 5
// для женщин: (10 х вес) + (6,25 х рост) – (5 х возраст) — 161
    int gender;
    if (selectedMan == 'notCheck') {
      gender = 5;
    } else {
      gender = -161;
    }
    result = (10 * weight) + (6.25 * _slider) - (5 * age) + gender;
    return result.round();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        centerTitle: true,
        title: const Text('Calorie Calculator',
            style: AppTextStyle.appBarTextStyle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedWoman == 'notCheck') {
                        selectedWoman == 'check';
                      } else if (selectedMan == 'notCheck') {
                        selectedMan = 'check';
                      } else {
                        selectedMan = 'notCheck';
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedMan == 'check'
                          ? const Color.fromARGB(255, 83, 93, 102)
                          : Colors.red[400],
                    ),
                    width: 170,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.man,
                          size: 70,
                        ),
                        Text(
                          'Мужчина',
                          style: AppTextStyle.genderTextStyle,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (selectedMan == 'notCheck') {
                        selectedMan == 'check';
                      } else if (selectedWoman == 'notCheck') {
                        selectedWoman = 'check';
                      } else {
                        selectedWoman = 'notCheck';
                      }
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: selectedWoman == 'check'
                          ? const Color.fromARGB(255, 83, 93, 102)
                          : Colors.red[400],
                    ),
                    width: 170,
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.woman,
                          size: 70,
                        ),
                        Text(
                          'Женщина',
                          style: AppTextStyle.genderTextStyle,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: AppContainerStyle.containerStyle,
              width: double.infinity,
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Рост',
                    style: AppTextStyle.sliderTextStyle,
                  ),
                  Text(
                    '${_slider.round()}',
                    style: AppTextStyle.sliderCounterTextStyle,
                  ),
                  Slider(
                    label: _slider.round().toString(),
                    max: 210,
                    value: _slider,
                    onChanged: (value) => setState(
                      () {
                        _slider = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: AppContainerStyle.containerStyle,
                  width: 170,
                  height: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Возраст',
                        style: AppTextStyle.ageTextStyle,
                      ),
                      Text(
                        '$age',
                        style: AppTextStyle.weightCounterTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: ageCounterMinus,
                            child: const Icon(Icons.exposure_minus_1),
                          ),
                          const SizedBox(width: 5),
                          ElevatedButton(
                            onPressed: ageCounterPlus,
                            child: const Icon(Icons.exposure_plus_1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: AppContainerStyle.containerStyle,
                  width: 170,
                  height: 190,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Вес',
                        style: AppTextStyle.weightTextStyle,
                      ),
                      Text(
                        '$weight',
                        style: AppTextStyle.weightCounterTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: weightCounterMinus,
                            child: const Icon(Icons.exposure_minus_1),
                          ),
                          const SizedBox(width: 5),
                          ElevatedButton(
                            onPressed: weightCounterPlus,
                            child: const Icon(Icons.exposure_plus_1),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: AppButtonStyle.resultButtonStyle,
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 83, 93, 102),
                  title: const Text(
                    'Ваш результат:',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w400),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Calorie',
                        style: TextStyle(fontSize: 30, color: Colors.white),
                      ),
                      Text(
                        '${resultCalculate()}',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      style: AppTextButtonStyle.textButtonStyle,
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      style: AppTextButtonStyle.textButtonStyle,
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              ),
              child: const Text('УЗНАТЬ',
                  style: AppTextStyle.rusultButtonTextStyle),
            )
          ],
        ),
      ),
    );
  }
}
