import 'package:daitda/design/designs.dart';
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
    double xc;
    double yc;

    lastSize = size;
    var paint = Paint()
      ..color = ColorSet().backgroundColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;
    canvas.scale(1);

    displaySize.width;
    displaySize.height;
    Path path = Path();

    path.moveTo(0, size.height / 2);
    for (int i = 0; i < input.length - 1; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);

    canvas.drawPath(path, paint);
    print(input);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
