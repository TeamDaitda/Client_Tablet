import 'package:daitda/UIConponent/AnimatedLiquidLinearProgressIndicator.dart';
import 'package:daitda/UIConponent/processBar.dart';
import 'package:daitda/UIConponent/uiComponent.dart';
import 'package:daitda/controller/progress.dart';
import 'package:daitda/data/category.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:daitda/design/designSet.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  final designSet = Get.put(DesignSet());
  final progressData = Get.put(ProgressData());
  final colorSet = ColorSet();
  CategoryMember thisCategoryMember;

  @override
  void initState() {
    thisCategoryMember = Get.arguments;
    designSet.setScreenWidthAndHeight(w: Get.size.width, h: Get.size.height);
    progressData.setData(0.2);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);

    return Scaffold(
      body: Container(
        child: Row(
          children: [
            Column(
              children: [
                renderLogoArea(),
                renderProgressArea(),
              ],
            ),
            Row(
              children: [
                renderInputcardArea(),
                renderInputArea(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget renderLogoArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.logoAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getLogoAreaWidth(),
      height: designSet.getLogoAreaHeight(),
    );
  }

  Widget renderProgressArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.progressAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getProgressAreaWidth(),
      height: designSet.getProgressAreaHeight(),
      child: Column(
        children: [
          AnimatedLiquidLinearProgressIndicator(),
          ProcessBar(
            index: 1,
          ),
        ],
      ),
    );
  }

  Widget renderInputcardArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.mainAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getInputcardAreaWidth(),
      height: designSet.getInputcardAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorSet.mainCardMackgroundcolor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: FlatButton(
            child: Text(thisCategoryMember.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                )),
            color: Colors.white,
            onPressed: () {
              Get.toNamed('/paymentPage');
            },
          ),
        ),
      ),
    );
  }

  Widget renderInputArea() {
    return Container(
      decoration: BoxDecoration(
        color: colorSet.inputAreaColor,
        border: Border.all(
          width: 0.5,
          color: colorSet.dividorColor,
        ),
      ),
      width: designSet.getInputAreaWidth(),
      height: designSet.getInputAreaHeight(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            color: colorSet.mainCardMackgroundcolor,
            borderRadius: BorderRadius.circular(20),
          ),

          // child: FlatButton(
          //       child: Text('camera', style: TextStyle(
          //       fontSize: 16,
          //       color: Colors.black,)
          //       ),
          //       color: Colors.white,
          //       onPressed: () {
          //         Get.toNamed('/cameraPage');
          //       },
          //     ),

          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 160, horizontal: 80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "이름을 알려주세요.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "결과물에 기부자님의 성함이 기재됩니다.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(),
                ),
                UIComponent().buildHeightSizedBox(50),
                Text(
                  "연락처를 입력해주세요.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "결과물에 기부자님의 연락처가 기재됩니다.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(),
                ),
                UIComponent().buildHeightSizedBox(50),
                Text(
                  "소속을 입력해주세요.",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "결과물에 기부자님의 직업이 기재됩니다.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 200,
                  height: 40,
                  child: TextField(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
