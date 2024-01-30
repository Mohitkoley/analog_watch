import 'dart:async';

import 'package:analog_watch/customPaints/clock_painter.dart';
import 'package:analog_watch/utils.dart';
import 'package:flutter/material.dart';

class ClockScreen extends StatefulWidget {
  const ClockScreen({super.key});

  @override
  State<ClockScreen> createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  Timer? _timer;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Clock Screen')),
        body: Container(
          alignment: Alignment.center,
          child: Container(
            height: context.height / 1.7,
            width: context.width,
            padding: const EdgeInsets.all(16),
            child: CustomPaint(
              painter: ClockPainter(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ));
  }
}
