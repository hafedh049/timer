import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:timer/globals.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _duration = 1000;

  final GlobalKey<State> _counterKey = GlobalKey<State>();

  late final Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
      1.seconds,
      (Timer timer) {
        if (_duration == 0) {
          _timer.cancel();
        } else {
          _counterKey.currentState!.setState(() => _duration -= 1000);
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  List<String> convertDuration(int milliseconds) {
    final Duration duration = Duration(milliseconds: milliseconds);

    final int hours = duration.inHours;
    final int minutes = duration.inMinutes.remainder(60);
    final int seconds = duration.inSeconds.remainder(60);

    final String hoursStr = hours.toString().padLeft(2, '0');
    final String minutesStr = minutes.toString().padLeft(2, '0');
    final String secondsStr = seconds.toString().padLeft(2, '0');

    return <String>[hoursStr, minutesStr, secondsStr];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StatefulBuilder(
          key: _counterKey,
          builder: (BuildContext context, void Function(void Function()) _) {
            final List<String> duration = convertDuration(_duration);
            return Animate(
              key: ValueKey<int>(_duration),
              effects: <Effect>[FadeEffect(duration: 500.ms)],
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(duration[0], style: TextStyle(color: white, fontSize: 30.sp, fontWeight: FontWeight.w500, letterSpacing: 2)),
                  Text(" : ", style: TextStyle(color: white, fontSize: 30.sp, fontWeight: FontWeight.w500, letterSpacing: 2)),
                  Text(duration[1], style: TextStyle(color: white, fontSize: 30.sp, fontWeight: FontWeight.w500, letterSpacing: 2)),
                  Text(" : ", style: TextStyle(color: white, fontSize: 30.sp, fontWeight: FontWeight.w500, letterSpacing: 2)),
                  Text(duration[2], style: TextStyle(color: white, fontSize: 30.sp, fontWeight: FontWeight.w500, letterSpacing: 2)),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
