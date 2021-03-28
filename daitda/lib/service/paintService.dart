import 'dart:math';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:daitda/model/outputModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class CurvePainter extends CustomPainter {
  List<OutPut> input;
  Size lastSize;
  Size displaySize;
  CurvePainter({@required this.input, @required this.displaySize});

  @override
  void paint(Canvas canvas, Size size) {
    lastSize = size;
    var paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 5
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.scale(1);

    displaySize.width;
    displaySize.height;
    Path path = Path();
    for (int i = 0; i <= input.length; i++) {
      if (i == 0) {
        path.moveTo(0, size.height / 2);
        path.quadraticBezierTo(0, size.height / 2, input[0].dX, input[0].dY);
      } else if (i == input.length) {
        path.moveTo(size.width, size.height / 2);
        path.quadraticBezierTo(
            size.width, size.height / 2, input[63].dX, input[63].dY);
      } else {
        path.moveTo(input[i].dX, input[i].dY);
      }
      if (i < input.length - 6) {
        if (i == 0 || i % 6 == 0) {
          path.cubicTo(input[i + 1].dX, input[i + 1].dY, input[i + 2].dX,
              input[i + 2].dY, input[i + 3].dX, input[i + 3].dY);
        }
      }
    }

    canvas.drawPath(path, paint);
    print(input);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}