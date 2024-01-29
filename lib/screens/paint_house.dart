import 'package:analog_watch/customPaints/house_painter.dart';
import 'package:flutter/material.dart';

class PaintHouse extends StatelessWidget {
  const PaintHouse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: HousePainter(
          title: 'Dash\'s House', color: Theme.of(context).colorScheme.primary),
    );
  }
}
