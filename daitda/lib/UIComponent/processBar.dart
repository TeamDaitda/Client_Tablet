import 'package:daitda/design/colorSet.dart';
import 'package:daitda/design/designSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProcessBar extends StatelessWidget {
  final designSet = Get.put(DesignSet());
  final colorSet = ColorSet();

  final int index;
  final List text = ["카테고리 선택", "정보 입력", "광고 시청", "촬영", "기부 완료"];

  ProcessBar({this.index});

  @override
  Widget build(BuildContext context) {
    print(index);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              renderProcessBar(),
              renderProcessBarText(text, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderProcessBar() {
    return Container(
      child: Column(
        children: [
          renderProcessBarCircle(index: index, uniqueIndex: 0),
          renderProcessBarLine(index: index, uniqueIndex: 1),
          renderProcessBarCircle(index: index, uniqueIndex: 1),
          renderProcessBarLine(index: index, uniqueIndex: 2),
          renderProcessBarCircle(index: index, uniqueIndex: 2),
          renderProcessBarLine(index: index, uniqueIndex: 3),
          renderProcessBarCircle(index: index, uniqueIndex: 3),
          renderProcessBarLine(index: index, uniqueIndex: 4),
          renderProcessBarCircle(index: index, uniqueIndex: 4),
        ],
      ),
    );
  }

  Widget renderProcessBarText(List list, BuildContext context) {
    return Column(
      children: [
        renderProcessBarCircle(option: true, text: list[0]),
        renderProcessBarLine(option: true),
        renderProcessBarCircle(option: true, text: list[1]),
        renderProcessBarLine(option: true),
        renderProcessBarCircle(option: true, text: list[2]),
        renderProcessBarLine(option: true),
        renderProcessBarCircle(option: true, text: list[3]),
        renderProcessBarLine(option: true),
        renderProcessBarCircle(option: true, text: list[4]),
      ],
    );
  }

  Widget renderProcessBarCircle(
      {int index, int uniqueIndex, bool option, String text}) {
    return option == true
        ? Container(
            width: 100,
            height: 23,
            child: Text(
              text,
              style: TextStyle(color: colorSet.fontColor,
              fontSize: 18),
            ),
          )
        : Container(
            width: 13,
            height: 24,
            decoration: BoxDecoration(
              color: index >= uniqueIndex
                  ? colorSet.processBarActivecolor
                  : colorSet.processBarDisableColor,
              shape: BoxShape.circle,
            ),
          );
  }

  Widget renderProcessBarLine({int index, int uniqueIndex, bool option}) {
    final double processBarLineWidth = 1;
    final double processBarlineHeight = designSet.getBottomAreaHeight() * 0.4;
    return option == true
        ? Container(
            width: processBarLineWidth,
            height: processBarlineHeight,
            color: Colors.transparent,
          )
        : Container(
            width: processBarLineWidth,
            height: processBarlineHeight,
            color: index >= uniqueIndex
                ? colorSet.processBarActivecolor
                : colorSet.processBarDisableColor,
          );
  }
}
