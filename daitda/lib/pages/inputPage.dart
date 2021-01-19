import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeightSizedBox(50),
            _buildProcessWidget(),
            _buildHeightSizedBox(50),
            _buildCenter("기부자님에 대해 알려주세요", context),
          ],
        ),
      ),
    );
  }

  Widget _buildProcessWidget() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCircle(inputColor: ColorSet().activeColor),
            _buildLine(inputColor: ColorSet().disableColor),
            _buildCircle(inputColor: ColorSet().disableColor),
            _buildLine(inputColor: ColorSet().disableColor),
            _buildCircle(inputColor: ColorSet().disableColor),
            _buildLine(inputColor: ColorSet().disableColor),
            _buildCircle(inputColor: ColorSet().disableColor),
            _buildLine(inputColor: ColorSet().disableColor),
            _buildCircle(inputColor: ColorSet().disableColor),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildWidthSizedBox(175),
            _buildText(inputText: "정보입력"),
            _buildWidthSizedBox(10),
            _buildText(inputText: "카테고리 선택"),
            _buildWidthSizedBox(10),
            _buildText(inputText: "결제"),
            _buildWidthSizedBox(10),
            _buildText(inputText: "촬영"),
            _buildWidthSizedBox(10),
            _buildText(inputText: "기부완료"),
            _buildWidthSizedBox(175),
          ],
        ),
      ],
    );
  }

  Widget _buildLine({Color inputColor}) {
    return Container(
      height: 1,
      width: 150,
      color: inputColor,
    );
  }

  Widget _buildCircle({Color inputColor}) {
    return Container(
      width: 22,
      height: 22,
      decoration: BoxDecoration(
        color: inputColor,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildText({String inputText}) {
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

  Widget _buildWidthSizedBox(double _width) {
    return SizedBox(
      width: _width,
    );
  }

  Widget _buildHeightSizedBox(double _height) {
    return SizedBox(
      height: _height,
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
            _buildHeightSizedBox(50),
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
            _buildHeightSizedBox(50),
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

  Widget _buildCenter(String inputTitle, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          child: FlatButton(
            color: ColorSet().buttonColor,
            onPressed: () {
              Get.back();
            },
            child: Icon(Icons.keyboard_arrow_left),
          ),
        ),
        Container(
          // color: Color(0xfff6f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                inputTitle,
                style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              Container(
                color: ColorSet().mainBoxColor,
                width: 1000,
                height: MediaQuery.of(context).size.height - 229,
                child: _buildBody(),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: FlatButton(
            color: ColorSet().buttonColor,
            onPressed: () {
              Get.toNamed('/categoryPage');
            },
            child: Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ],
    );
  }
}
