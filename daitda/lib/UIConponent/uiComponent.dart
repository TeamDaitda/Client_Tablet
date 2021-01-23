import 'package:daitda/UIConponent/uiComponentCalc.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UIComponent {
  //  네비게이션 버튼을 랜더링 해줍니다. option = 'go', 'back'
  renderNavigationButton({String option, String router}) {
    Icon thisIcon;
    if (option == 'go' || option == 'allBack') {
      thisIcon = Icon(Icons.keyboard_arrow_right);
    } else if (option == 'back') {
      thisIcon = Icon(Icons.keyboard_arrow_left);
    } else {
      return;
    }
    return Container(
      width: 50,
      height: 50,
      child: Card(
        elevation: 10,
        color: ColorSet().buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
            onTap: () {
              if (option == 'go') {
                Get.toNamed(router);
              } else if (option == 'back') {
                Get.back();
              } else if (option == 'allBack') {
                Get.offAllNamed(router);
              }
            },
            child: thisIcon),
      ),
    );
  }

  //  상단 상태바를 랜더링해줍니다.
  renderTopStateBar(int index) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCircle(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 1, index: index)),
            buildLine(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 2, index: index)),
            buildCircle(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 2, index: index)),
            buildLine(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 3, index: index)),
            buildCircle(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 3, index: index)),
            buildLine(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 4, index: index)),
            buildCircle(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 4, index: index)),
            buildLine(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 5, index: index)),
            buildCircle(
                inputColor: UIComponentCalc()
                    .calcIndexToColor(topStateBarIndex: 5, index: index)),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            buildWidthSizedBox(175),
            buildText(inputText: "정보입력"),
            buildWidthSizedBox(10),
            buildText(inputText: "카테고리 선택"),
            buildWidthSizedBox(10),
            buildText(inputText: "결제"),
            buildWidthSizedBox(10),
            buildText(inputText: "촬영"),
            buildWidthSizedBox(10),
            buildText(inputText: "기부완료"),
            buildWidthSizedBox(175),
          ],
        ),
      ],
    );
  }

  renderTitleText(String title) {
    return Text(
      title,
      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
      textAlign: TextAlign.start,
    );
  }

  Widget buildLine({Color inputColor}) {
    return Container(
      height: 1,
      width: 150,
      color: inputColor,
    );
  }

  Widget buildCircle({Color inputColor}) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: inputColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget buildText({String inputText}) {
    return Container(
      width: 80,
      child: Text(
        inputText,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

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
