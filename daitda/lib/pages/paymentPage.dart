import 'package:flutter/material.dart';

class PaymentPage extends StatefulWidget {
  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildHeightSizedBox(50),
            _buildProcessWidget(),
            _buildBody("어떤 곳에 기부하고 싶으세요?", context),
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
            _buildCircle(inputColor: Color(0xff9470ac)),
            _buildLine(inputColor: Color(0xff9470ac)),
            _buildCircle(inputColor: Color(0xff9470ac)),
            _buildLine(inputColor: Color(0xff9470ac)),
            _buildCircle(inputColor: Color(0xff9470ac)),
            _buildLine(inputColor: Color(0xffc4c4c4)),
            _buildCircle(inputColor: Color(0xffc4c4c4)),
            _buildLine(inputColor: Color(0xffc4c4c4)),
            _buildCircle(inputColor: Color(0xffc4c4c4)),
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

  Widget _buildBody(String inputTitle, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: 50,
          height: 50,
          child: FlatButton(
            color: Color(0xfff0f0f3),
            onPressed: () {},
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
                color: Color(0xfff6f5f5),
                width: 1000,
                height: 450,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[],
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 50,
          height: 50,
          child: FlatButton(
            color: Color(0xfff0f0f3),
            onPressed: () {
              Navigator.pushNamed(context, '/paymentPage');
            },
            child: Icon(Icons.keyboard_arrow_right),
          ),
        ),
      ],
    );
  }
}
