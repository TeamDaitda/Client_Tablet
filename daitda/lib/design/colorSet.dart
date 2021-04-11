import 'package:flutter/material.dart';
import 'dart:math' as math;

class ColorSet {
  final Color tfColor = Colors.transparent;

  //  Top Process Bar Color
  final Color activeColor = Color(0xff9470ac);
  final Color disableColor = Color(0xffc4c4c4);

  //  Font Color
  final Color fontColor = Colors.white;
  final Color fontColorBlack = Color(0xff2c2f33);

  //  Container Color
  final Color backgroundColor = Color(0xff2c2f33);
  final Color mainBoxColor = Color(0xfff6f5f5);
  final Color buttonColor = Color(0xfff0f0f3);
  final Color boxDecorationColor = Color(0xfff0f0f3);

  //  Left Right Icon Color
  final Color lrIconColor = Colors.grey;

  //  2020 02 08 Update Color
  //  Area Color
  final Color logoAreaColor = Color(0xff2b2b2b);
  final Color progressAreaColor = Color(0xff2b2b2b);
  final Color mainAreaColor = Color(0xff2b2b2b);
  final Color bottomAreaColor = Color(0xff2b2b2b);
  final Color dividorColor = Color(0xff2b2b2b);
  final Color inputAreaColor = Color(0xff2b2b2b);
  final Color inputcardAreaColor = Color(0xff2b2b2b);
  final Color paymentAreaColor = Color(0xff2b2b2b);
  //  UI Component Background Color
  final Color logoBackgroundColor = Colors.transparent;
  final Color progressBackgroundColor = Colors.transparent;

  //  Progress Bar Color
  final Color progressBarBackgroundColor = Colors.white;
  final Color progressBarValueColor = Color(0xff2c2f33);

  //  Process Bar Color
  final Color processBarActivecolor = Colors.white;
  final Color processBarDisableColor = Color(0xff444444);

  //  Main Background Color
  final Color mainCardMackgroundcolor = Colors.white;

  //  Text Color
  final Color positivetextColor = Color(0xff2c2f33);
  final Color notPositiveTextColor = Color(0xffE53A40);

  Color randomColor() {
    return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
        .withOpacity(1.0);
  }
}
