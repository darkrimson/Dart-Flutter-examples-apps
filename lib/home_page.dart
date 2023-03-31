import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'generate.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Provider.of<Generate>(context, listen: false).generate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<Generate>(context).data;
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (context, index) => data[index],
          ),
        ),
      ),
    );
  }
}
