import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnalogWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
        Offset(size.width / 2, size.height / 2), size.width / 6, paint);

    final paintArc = Paint()
      ..color = Colors.purple
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final rect = Rect.fromCenter(
      center: Offset(size.width / 2, size.height / 4),
      width: size.width / 2,
      height: size.height / 5,
    );

    canvas.drawRect(rect, paintArc);

    canvas.drawArc(
      rect,
      math.pi / 2,
      3 * math.pi / 4,
      true,
      paintArc,
    );

    // my understanding = start from given angle and upto given angle
    // wheter its less or more then angle will be in anti clock or clock wise
    // i.e 0 to 90 will be in clock wise and 90 to 180 will be in anti clock wise
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
