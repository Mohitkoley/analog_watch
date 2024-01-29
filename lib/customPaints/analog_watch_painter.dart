import 'package:flutter/material.dart';

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
    final path = Path();
    path.moveTo(100, 100);
    path.lineTo(200, 50);
    path.quadraticBezierTo(300, 150, 250, 250);
    path.arcToPoint(Offset(150, 200),
        radius: Radius.circular(40), clockwise: false);
    path.cubicTo(100, 200, 50, 150, 100, 100);
    path.close();

    final pathPaint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;

    canvas.drawPath(path, pathPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
