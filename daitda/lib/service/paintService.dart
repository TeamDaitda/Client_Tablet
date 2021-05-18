import 'dart:math';
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

  final int random;

  CurvePainter(
    this._animation,
    this.input,
    this.displaySize,
    this.random,
  ) : super(repaint: _animation);

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

  Path createAnyPath1(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 2);

    // 턱 (0 ~ 16:17)
    for (int i = 0; i < 16; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 왼쪽 눈썹 (17 ~ 21:22)
    for (int i = 17; i < 21; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 오른쪽 눈썹 (22 ~ 26:27)
    for (int i = 22; i < 26; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 코 (27 ~ 35:36)
    for (int i = 27; i < 35; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 왼쪽 눈 (36 ~ 41:42)
    for (int i = 36; i < 41; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 오른쪽 눈 (42 ~ 47:48)
    for (int i = 42; i < 47; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 입 (48 ~ 65:66)
    for (int i = 48; i < 65; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);

    return path;
  }

  Path createAnyPath2(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 2);

    // 입 (48 ~ 65:66)
    for (int i = 48; i < 65; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 왼쪽 눈썹 (17 ~ 21:22)
    for (int i = 17; i < 21; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 왼쪽 눈 (36 ~ 41:42)
    for (int i = 36; i < 41; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 오른쪽 눈썹 (22 ~ 26:27)
    for (int i = 22; i < 26; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 코 (27 ~ 35:36)
    for (int i = 27; i < 35; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 오른쪽 눈 (42 ~ 47:48)
    for (int i = 42; i < 47; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 턱 (0 ~ 16:17)
    for (int i = 0; i < 16; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);

    return path;
  }

  Path createAnyPath3(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 2);

    // 오른쪽 눈썹 (22 ~ 26:27)
    for (int i = 22; i < 26; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
// 오른쪽 눈 (42 ~ 47:48)
    for (int i = 42; i < 47; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 코 (27 ~ 35:36)
    for (int i = 27; i < 35; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 입 (48 ~ 65:66)
    for (int i = 48; i < 65; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 왼쪽 눈 (36 ~ 41:42)
    for (int i = 36; i < 41; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
// 왼쪽 눈썹 (17 ~ 21:22)
    for (int i = 17; i < 21; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
// 턱 (0 ~ 16:17)
    for (int i = 0; i < 16; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);
    return path;
  }

  Path createAnyPath4(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 2);

    // 오른쪽 눈썹 (22 ~ 26:27)
    for (int i = 22; i < 26; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 왼쪽 눈썹 (17 ~ 21:22)
    for (int i = 17; i < 21; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 오른쪽 눈 (42 ~ 47:48)
    for (int i = 42; i < 47; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 왼쪽 눈 (36 ~ 41:42)
    for (int i = 36; i < 41; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 입 (48 ~ 65:66)
    for (int i = 48; i < 65; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 코 (27 ~ 35:36)
    for (int i = 27; i < 35; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 턱 (0 ~ 16:17)
    for (int i = 0; i < 16; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);

    return path;
  }

  Path createAnyPath5(Size size) {
    Path path = new Path();
    path.moveTo(0, size.height / 2);

    // 왼쪽 눈썹 (17 ~ 21:22)
    for (int i = 17; i < 21; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
// 왼쪽 눈 (36 ~ 41:42)
    for (int i = 36; i < 41; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 오른쪽 눈 (42 ~ 47:48)
    for (int i = 42; i < 47; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 오른쪽 눈썹 (22 ~ 26:27)
    for (int i = 22; i < 26; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }

    // 입 (48 ~ 65:66)
    for (int i = 48; i < 65; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    // 턱 (0 ~ 16:17)
    for (int i = 0; i < 16; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    path.quadraticBezierTo(input[input.length - 1].dX,
        input[input.length - 1].dY, size.width, size.height / 2);
// 코 (27 ~ 35:36)
    for (int i = 27; i < 35; i++) {
      xc = (input[i].dX + input[i + 1].dX) / 2;
      yc = (input[i].dY + input[i + 1].dY) / 2;
      path.quadraticBezierTo(input[i].dX, input[i].dY, xc, yc);
    }
    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = this._animation.value;
    final path = createAnimatedPath(
        random == 1
            ? createAnyPath1(size)
            : random == 2
                ? createAnyPath2(size)
                : random == 3
                    ? createAnyPath3(size)
                    : random == 4
                        ? createAnyPath4(size)
                        : random == 5
                            ? createAnyPath5(size)
                            : createAnyPath1(size),
        animationPercent);

    // random == 1 ? ;

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
