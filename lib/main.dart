import 'package:flutter/material.dart';
import 'package:timer/globals.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: dark),
      debugShowCheckedModeBanner: false,
      home: const Counter(),
    );
  }
}
