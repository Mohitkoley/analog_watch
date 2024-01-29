import 'package:flutter/material.dart';

class AnalogWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    canvas.drawLine(Offset(size.width / 2, size.height / 2),
        Offset(size.width, size.height / 2), paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
