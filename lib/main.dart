import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timer/counter.dart';
import 'package:timer/globals.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (BuildContext context, Orientation orientation, ScreenType screenType) => MaterialApp(
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: dark),
        debugShowCheckedModeBanner: false,
        home: const Counter(),
      ),
    );
  }
}
