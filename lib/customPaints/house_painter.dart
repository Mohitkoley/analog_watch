import 'package:flutter/material.dart';

class HousePainter extends CustomPainter {
  final String title;
  final Color color;

  HousePainter({required this.title, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    final paintRoof = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double roofHeight = size.height / 3;
    final path = Path()
      ..moveTo(0, roofHeight)
      ..lineTo(size.width / 2, 0)
      ..lineTo(size.width, roofHeight)
      ..close();

    // roof
    canvas.drawPath(path, paintRoof);

    final paintChimney = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double chimneyWidth = size.width / 10;
    double chimneyHeight = size.height / 4;
    double chimneyCenterX = size.width / 1.2;
    double chimneyCenterY = roofHeight / 2;

    // chimney
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(chimneyCenterX, chimneyCenterY),
          width: chimneyWidth,
          height: chimneyHeight,
        ),
        paintChimney);

    final paintHouse = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    double paddingFromRoof = size.width / 10;

    // home wall
    final pathHouse = Path()
      ..moveTo(paddingFromRoof, roofHeight)
      ..lineTo(paddingFromRoof, size.height)
      ..lineTo(size.width - paddingFromRoof, size.height)
      ..lineTo(size.width - paddingFromRoof, roofHeight)
      ..close();

    // canvas.drawPath(pathHouse, paintHouse);

    final homeWall = Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 1.5),
        width: size.width / 1.2,
        height: size.height / 1.5);

    canvas.drawRect(homeWall, paintHouse);

    final paintDoor = Paint()
      ..color = color
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double doorWidth = size.width / 3.5;
    double doorHeight = size.height / 2.8;
    double doorCenterX = size.width / 2;
    double doorCenterY = size.height - doorHeight / 2;

    // door
    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(doorCenterX, doorCenterY),
          width: doorWidth,
          height: doorHeight,
        ),
        paintDoor);
    final paintDoorKnob = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double doorKnobRadius = 10;

    // door knob
    canvas.drawCircle(
        Offset(size.width / 2 + doorWidth / 2 - (doorKnobRadius + 8),
            size.height - doorHeight / 2),
        doorKnobRadius,
        paintDoorKnob);
    TextSpan span = TextSpan(
      style: const TextStyle(
        color: Colors.black,
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      text: title,
    );

    // house name
    TextPainter tp = TextPainter(
      text: span,
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );
    tp.layout();
    tp.paint(
        canvas,
        Offset(size.width / 2 - tp.width / 2,
            size.height - doorHeight / 1.5 - tp.height / 2));

    final paintWindow = Paint()
      ..color = color
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke;
    double windowWidth = size.width / 4.5;
    double windowHeight = size.height / 5.5;

    canvas.drawRect(
        Rect.fromCenter(
          center: Offset(size.width - paddingFromRoof - 20 - (windowWidth / 2),
              roofHeight + 20 + (windowHeight / 2)),
          width: windowWidth,
          height: windowHeight,
        ),
        paintWindow);

    // the window panes
    final paintWindowPanes = Paint()
      ..color = Colors.black
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    canvas.drawLine(
        Offset(size.width - paddingFromRoof - 20 - (windowWidth / 2),
            roofHeight + 20),
        Offset(size.width - paddingFromRoof - 20 - (windowWidth / 2),
            roofHeight + 20 + windowHeight),
        paintWindowPanes);

    canvas.drawLine(
        Offset(
            size.width -
                paddingFromRoof -
                20 -
                (windowWidth / 2) -
                (windowWidth / 2),
            roofHeight + 20 + (windowHeight / 2)),
        Offset(
            size.width -
                paddingFromRoof -
                20 -
                (windowWidth / 2) +
                (windowWidth / 2),
            roofHeight + 20 + (windowHeight / 2)),
        paintWindowPanes);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }
}
