import 'package:daitda/UIComponent/uiComponentCalc.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIComponent {
  Widget buildWidthSizedBox(double _width) {
    return SizedBox(
      width: _width,
    );
  }

  Widget buildHeightSizedBox(double _height) {
    return SizedBox(
      height: _height,
    );
  }
}
