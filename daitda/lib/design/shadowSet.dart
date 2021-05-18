import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ShadowSet {
  static List<BoxShadow> shadow() {
    List<BoxShadow> shadow = [
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        spreadRadius: 0.3,
        blurRadius: 5,
        offset: Offset(0, 2),
      )
    ];
    return shadow;
  }
}
