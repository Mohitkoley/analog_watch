import 'package:analog_watch/customPaints/analog_watch_painter.dart';
import 'package:analog_watch/utils.dart';
import 'package:flutter/material.dart';

class MyCustomHomeScreen extends StatefulWidget {
  const MyCustomHomeScreen({super.key});

  @override
  State<MyCustomHomeScreen> createState() => _MyCustomHomeScreenState();
}

class _MyCustomHomeScreenState extends State<MyCustomHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      alignment: Alignment.center,
      child: SizedBox(
        height: context.height,
        width: context.width,
        child: CustomPaint(
          painter: AnalogWatchPainter(),
        ),
      ),
    ));
  }
}
