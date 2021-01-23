import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Colors.black;
    paint.strokeWidth = 3;
    canvas.drawLine(Offset(43, 116), Offset(45, 132), paint);
    canvas.drawLine(Offset(45, 132), Offset(48, 147), paint);
    canvas.drawLine(Offset(45, 132), Offset(48, 147), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
