import 'package:flutter/material.dart';

class AnalogWatchPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final linePaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final circlePaint = Paint()
      ..color = Colors.red
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    final rectanglePaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final squarePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 4
      ..style = PaintingStyle.fill;

    final ovalPaint = Paint()
      ..color = Colors.orange
      ..style = PaintingStyle.fill
      ..strokeWidth = 4;

    final center = Offset(3 * size.width / 4, size.height / 2);

    canvas.drawCircle(center, size.width / 4, circlePaint);

    canvas.drawRect(
        Rect.fromCenter(
            center: Offset(0, size.height / 2),
            width: size.width / 2,
            height: size.height / 3),
        rectanglePaint);

    canvas.drawRect(
        Rect.fromCenter(
            center: center, width: size.width / 3, height: size.height / 6),
        squarePaint);

    canvas.drawOval(
        Rect.fromCenter(
            center: Offset(size.width / 2.7, size.height / 2),
            width: size.width / 4,
            height: size.height / 2),
        ovalPaint);

    canvas.drawLine(center, Offset(size.width, size.height / 2), linePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
