import 'package:daitda/CurvePainter.dart';
import 'package:daitda/UIConponent/uiComponent.dart';
import 'package:daitda/api/ImageApi.dart';
import 'package:daitda/controller/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResultPage extends StatefulWidget {
  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            UIComponent().buildHeightSizedBox(50),
            UIComponent().renderTopStateBar(5),
            UIComponent().buildHeightSizedBox(50),
            _buildCenter("결과페이지", context),
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
              Row(
                children: [
                  UIComponent().renderTitleText(title),
                  FlatButton(
                    color: Colors.pink,
                    onPressed: () {
                      // print('Start');
                    },
                    child: Text("요청"),
                  ),
                ],
              ),
              CustomPaint(
                painter: CurvePainter(input: ImageApi().transImage()),
                child: Container(
                  width: 1000,
                  height: MediaQuery.of(context).size.height - 229,
                ),
              ),
            ],
          ),
        ),
        UIComponent().renderNavigationButton(option: 'allBack', router: '/'),
      ],
    );
  }
}
