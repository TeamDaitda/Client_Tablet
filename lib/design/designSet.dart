import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignSet extends GetxController {
  static DesignSet get to => Get.find();

  final colorSet = ColorSet();

  double _screenWidth;
  double _screenHeight;

  DesignSet() {
    _screenWidth = null;
    _screenHeight = null;
  }

  void setScreenWidthAndHeight({@required double w, @required double h}) {
    _screenWidth = w;
    _screenHeight = h;
    update();
  }

  double getScreenWidth() {
    return _screenWidth != null ? _screenWidth : 0;
  }

  double getScreenHeight() {
    return _screenHeight != null ? _screenHeight : 0;
  }

  double getLogoAreaWidth() {
    return _screenWidth != null ? _screenWidth * 0.15 : 0;
  }

  double getLogoAreaHeight() {
    return _screenHeight != null ? _screenHeight * 0.2 : 0;
  }

  double getProgressAreaWidth() {
    return _screenWidth != null ? _screenWidth * 0.15 : 0;
  }

  double getProgressAreaHeight() {
    return _screenHeight != null ? _screenHeight * 0.8 : 0;
  }

  double getMainAreaWidth() {
    return _screenWidth != null ? _screenWidth * 0.85 : 0;
  }

  double getMainAreaHeight() {
    return _screenHeight != null ? _screenHeight * 0.7 : 0;
  }

  double getInputAreaWidth() {
    return _screenWidth != null ? _screenWidth * 0.425 : 0;
  }

  double getInputAreaHeight() {
    return _screenHeight != null ? _screenHeight : 0;
  }

  double getInputcardAreaHeight() {
    return _screenHeight != null ? _screenHeight : 0;
  }

  double getInputcardAreaWidth() {
    return _screenHeight != null ? _screenWidth * 0.425 : 0;
  }

  double getPaymentAreaWidth() {
    return _screenHeight != null ? _screenWidth * 0.85 : 0;
  }

  double getPaymentAreaHeight() {
    return _screenHeight != null ? _screenHeight : 0;
  }

  double getCameraAreaWidth() {
    return _screenHeight != null ? _screenWidth * 0.85 : 0;
  }

  double getCameraAreaHeight() {
    return _screenHeight != null ? _screenHeight : 0;
  }

  double getBottomAreaWidth() {
    return _screenWidth != null ? _screenWidth * 0.85 : 0;
  }

  double getBottomAreaHeight() {
    return _screenHeight != null ? _screenHeight * 0.3 : 0;
  }

  double getProgressBarWidth() {
    return getProgressAreaWidth() != null ? getProgressAreaWidth() * 0.8 : 0;
  }

  double getProgressBarHeight() {
    return getProgressAreaHeight() != null ? getProgressAreaHeight() * 0.05 : 0;
  }

  TextStyle getStyleDialogButtonText({@required bool isPositive}) {
    return TextStyle(
      color: isPositive
          ? colorSet.notPositiveTextColor
          : colorSet.positivetextColor,
      fontWeight: FontWeight.bold,
    );
  }

  TextStyle getStyleDialogTitleText() {
    return TextStyle(
      color: colorSet.fontColorBlack,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );
  }

  TextStyle getStyleInputPageText() {
    return TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.bold,
      fontSize: 17,
    );
  }
}
