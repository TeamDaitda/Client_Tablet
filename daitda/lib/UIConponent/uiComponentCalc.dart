import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';

class UIComponentCalc {
  calcIndexToColor({int topStateBarIndex, int index}) {
    if (topStateBarIndex <= index) {
      return ColorSet().activeColor;
    } else {
      return ColorSet().disableColor;
    }
  }
}
