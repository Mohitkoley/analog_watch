import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:ui' as ui;

class ClockPainter extends CustomPainter {
  final Color color;
  late DateTime _datetime;

  ClockPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    _datetime = DateTime.now();
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

// add some style by drawing  circles
    int lineIndex = 0, columnIndex = 0;
    while (lineIndex < 5) {
      while (columnIndex < 5) {
        _drawStyleCircle(
            canvas: canvas,
            size: const Size(100, 100),
            lineIndex: lineIndex,
            columnIndex: columnIndex);
        columnIndex++;
      }
      columnIndex = 0;
      lineIndex++;
    }
    final radius = size.width / 2;

    // clock circle
    final paintClockCircle = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    Offset center = Offset(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, paintClockCircle);

    canvas.translate(size.width / 2, size.height / 2);

    TextPainter digitPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    const digitStyle = TextStyle(
        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

    for (int i = 1; i <= 12; i++) {
      digitPainter.text = TextSpan(text: "$i", style: digitStyle);

      digitPainter.layout();

      double degree = (i - 3) * 30;
      double x =
          cos(_getRadians(degree)) * (radius - 30) - digitPainter.width / 1.8;
      double y =
          sin(_getRadians(degree)) * (radius - 30) - digitPainter.width / 1.8;

      digitPainter.paint(canvas, Offset(x, y));
    }

    double maxRadius = 150;
    double maxStroke = 6;

    // draw hour hand
    _drawHourHand(canvas, maxRadius / 2.5, maxStroke, _datetime);

    // draw minute hand
    _drawMinuteHand(canvas, maxRadius / 1.5, maxStroke / 1.4, _datetime);

    // draw second hand
    _drawSecondHand(canvas, maxRadius / 1.2, maxStroke / 2, _datetime);

    // draw center point
    _drawCenter(canvas, maxStroke * 1.5, maxStroke);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // true because clock should update each second
    return true;
  }

  void _drawHourHand(
      Canvas canvas, double radius, double strokeWidth, DateTime dateTime) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    double angle = (dateTime.hour % 12 + dateTime.minute / 60.0 - 3) * 30;
    Offset handOffset =
        Offset(cos(_getRadians(angle)), sin(_getRadians(angle)));

    canvas.drawLine(Offset(0, 0), handOffset * radius, paint);
  }

  void _drawMinuteHand(
      Canvas canvas, double radius, double strokeWidth, DateTime dateTime) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    double angle = (dateTime.minute - 15) * 6;
    Offset handOffset =
        Offset(cos(_getRadians(angle)), sin(_getRadians(angle)));

    canvas.drawLine(Offset(0, 0), handOffset * radius, paint);
  }

  _drawSecondHand(
      Canvas canvas, double radius, double strokeWidth, DateTime dateTime) {
    final paint = Paint()
      ..color = Colors.red
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.fill;

    double angle = (dateTime.second - 15) * 6;
    Offset handOffset =
        Offset(cos(_getRadians(angle)), sin(_getRadians(angle)));

    canvas.drawLine(Offset(0, 0), handOffset * radius, paint);
  }

  _drawCenter(Canvas canvas, double radius, double strokeWidth) {
    Paint centerPointPaint = Paint()
      ..strokeWidth = (radius / 12)
      ..strokeCap = StrokeCap.round
      ..color = Colors.black;
    canvas.drawPoints(
        ui.PointMode.points, const [Offset(0, 0)], centerPointPaint);
  }

  void _drawStyleCircle(
      {required Canvas canvas,
      required Size size,
      required int lineIndex,
      required int columnIndex}) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.7)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    Offset point = Offset(columnIndex * size.width, lineIndex * size.height);
    canvas.drawCircle(point, size.width / 2, paint);
  }

  double _getRadians(double angle) {
    return angle * pi / 180;
  }
}
