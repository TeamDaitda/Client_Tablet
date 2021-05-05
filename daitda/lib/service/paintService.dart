import 'dart:ui';

import 'package:daitda/design/designs.dart';
import 'package:daitda/model/outputModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CurvePainter extends CustomPainter {
  List<OutPut> input;
  Size displaySize;

  int animationValue;

  double xc;
  double yc;

  final Animation<double> _animation;

  CurvePainter(this._animation, this.input, this.displaySize)
      : super(repaint: _animation);

  Path createAnimatedPath(
    Path originalPath,
    double animationPercent,
  ) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;
    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(
    Path originalPath,
    double length,
  ) {
    var currentLength = 0.0;

    final path = new Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        // There might be a more efficient way of extracting an entire path
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  Path createAnyPath(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 2);
    for (int i = 0; i < input.length - 1; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = this._animation.value;
    final path = createAnimatedPath(createAnyPath(size), animationPercent);

    final Paint paint = Paint()
      ..color = ColorSet().backgroundColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.scale(1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
