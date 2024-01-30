import 'package:analog_watch/customPaints/clock_painter.dart';
import 'package:flutter/material.dart';

class PaintClock extends StatefulWidget {
  const PaintClock({super.key});

  @override
  State<PaintClock> createState() => _PaintClockState();
}

class _PaintClockState extends State<PaintClock> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
        painter: ClockPainter(
      color: Theme.of(context).colorScheme.primary,
    ));
  }
}
