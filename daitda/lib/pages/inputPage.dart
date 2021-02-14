import 'package:daitda/UIConponent/AnimatedLiquidLinearProgressIndicator.dart';
import 'package:daitda/UIConponent/uiComponent.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIComponent().buildHeightSizedBox(50),
            // UIComponent().renderTopStateBar(1),
            AnimatedLiquidLinearProgressIndicator(),

            UIComponent().buildHeightSizedBox(50),

            _buildCenter("기부자님에 대해 알려주세요", context),
          ],
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "성함을 입력해주세요.",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "결과물에 기부자님의 성함이 기재됩니다.",
              style: TextStyle(
                fontSize: 12,
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "결과물에 기부자님의 연락처가 기재됩니다.",
              style: TextStyle(
                fontSize: 12,
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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "결과물에 기부자님의 직업이 기재됩니다.",
              style: TextStyle(
                fontSize: 12,
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
    );
  }

  Widget _buildCenter(String title, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        UIComponent().renderNavigationButton(option: 'back'),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIComponent().renderTitleText(title),
              Container(
                width: 800,
                height: MediaQuery.of(context).size.height - 229,
                child: Card(
                  elevation: 0,
                  // shape: RoundedRectangleBorder(
                  //   borderRadius: BorderRadius.circular(20),
                  // ),
                  color: ColorSet().mainBoxColor,
                  child: _buildBody(),
                ),
              ),
            ],
          ),
        ),
        UIComponent()
            .renderNavigationButton(option: 'go', router: '/categoryPage'),
      ],
    );
  }
}
