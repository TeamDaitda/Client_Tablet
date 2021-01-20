import 'package:daitda/UIConponent/uiComponent.dart';
import 'package:daitda/design/colorSet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            UIComponent().buildHeightSizedBox(50),
            UIComponent().renderTopStateBar(3),
            UIComponent().buildHeightSizedBox(50),
            _buildCenter("이제, 기부해볼까요?", context),
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
          // color: Color(0xfff6f5f5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UIComponent().renderTitleText(title),
              Container(
                color: Color(0xfff6f5f5),
                width: 1000,
                height: MediaQuery.of(context).size.height - 229,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[],
                ),
              ),
            ],
          ),
        ),
        UIComponent()
            .renderNavigationButton(option: 'go', router: '/cameraPage'),
      ],
    );
  }
}
